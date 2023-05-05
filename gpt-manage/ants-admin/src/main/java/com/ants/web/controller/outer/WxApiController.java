package com.ants.web.controller.outer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ants.common.annotation.WxApiCheck;
import com.ants.common.base64.Base64Util;
import com.ants.common.config.AntsConfig;
import com.ants.common.constant.Constants;
import com.ants.common.core.controller.BaseController;
import com.ants.common.core.domain.AjaxResult;
import com.ants.common.core.redis.RedisCache;
import com.ants.common.exception.user.WxException;
import com.ants.common.utils.StringUtils;
import com.ants.common.utils.file.FileUploadUtils;
import com.ants.common.utils.gpt.ChatGPTUtil;
import com.ants.common.utils.object.ObjectUtil;
import com.ants.common.utils.token.JWTUtils;
import com.ants.common.utils.wx.WxUtil;
import com.ants.web.controller.ws.WebSocketManager;
import com.ants.weixin.domain.*;
import com.ants.weixin.domain.dto.WxApiCheckDTO;
import com.ants.weixin.domain.gpt.MessageVo;
import com.ants.weixin.domain.gpt.request.RequestVo;
import com.ants.weixin.domain.gpt.response.ResponseVo;
import com.ants.weixin.service.*;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/wx/api")
public class WxApiController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(WxApiController.class);

    @Value("${ants.serverHost}")
    String SERVER_HOST;

    @Value("${wx.app.id}")
    private String appid;

    @Value("${wx.app.secret}")
    private String appsecret;

    @Autowired
    private IWxUserService wxUserService;

    @Autowired
    private IWxCommonService wxCommonService;

    @Autowired
    private IWxChatService wxChatService;

    @Autowired
    private ChatGPTUtil chatGPTUtil;

    @Autowired
    private IWxFeedbackService wxFeedbackService;

    @Autowired
    private WebSocketManager webSocket;

    @GetMapping("/getCode")
    public AjaxResult getCode(@RequestParam("code") String code) {
        logger.info("[getCode] get code start {}", code);
        if (StringUtils.isEmpty(code)) {
            throw new WxException("用户信息获取异常");
        }
        Map<String, Object> data = WxUtil.getJscode2session(appid, appsecret, code);
        if (StringUtils.isNotEmpty(data) && !data.containsKey("errcode")) {
            // 判断当前用户是否存在数据库，如果存在数据库，判断数据库更新时间是否是1月内，如果是1月内，则返回数据库信息，否则让用户主动登录更新基本信息，如果不存在，则插入openid，返回数据
            String openid = String.valueOf(data.get("openid"));
            WxUser wxUser = wxUserService.selectWxUserByOpenid(openid);
            if (!ObjectUtil.isEmpty(wxUser)) {
                if (wxUser.getDisableFlag() == 1) {
                    logger.info("[getCode] get code fail, disable flag is 1, end {}", data);
                    return AjaxResult.error("当前账户禁用");
                } else if (this.judgeWithInMonth(wxUser.getLastLoginTime())) {
                    logger.info("[getCode] get code success, but data is before 1 month, end {}", data);
                    wxUser.setNickName(Base64Util.base64StrToText(wxUser.getNickName()));
                    data.put("hasUserInfo", true);
                    data.put("userInfo", JSON.toJSONString(wxUser));
                    data.put("AuthorizationToken", JWTUtils.sign(openid));
                    return AjaxResult.success(data);
                } else {
                    wxUser.setNickName(Base64Util.base64StrToText(wxUser.getNickName()));
                    if (StringUtils.isNotEmpty(wxUser.getRemark())) {
                        wxUser.setRemark(Base64Util.base64StrToText(wxUser.getRemark()));
                    }
                    data.put("hasUserInfo", true);
                    data.put("userInfo", JSON.toJSONString(wxUser));
                    data.put("AuthorizationToken", JWTUtils.sign(openid));
                    return AjaxResult.success(data);
                }
            } else {
                WxUser wxUserVo = new WxUser();
                wxUserVo.setOpenid(openid);
                String nickName = "AI_" + UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
                wxUserVo.setNickName(Base64Util.textToBase64Str(nickName));
                wxUserVo.setDeleteFlag(0);
                wxUserVo.setDisableFlag(0);
                wxUserVo.setLastLoginTime(new Date());
                wxUserService.insertWxUser(wxUserVo);
                wxUserVo.setNickName(nickName);
                data.put("hasUserInfo", true);
                data.put("userInfo", JSON.toJSONString(wxUserVo));
                data.put("AuthorizationToken", JWTUtils.sign(openid));
                // 存储第一句中文
                WxChat wxChat = new WxChat();
                wxChat.setRole("assistant");
                wxChat.setOpenid(openid);
                wxChat.setContent("你好，我是问答AI小助手~");
                wxChatService.insertWxChat(wxChat);
                return AjaxResult.success(data);
            }
        } else {
            String errmsg = data.containsKey("errmsg") ? String.valueOf(data.get("errmsg")) : "网络异常...";
            logger.info("[getCode] get code fail end {}", data);
            return AjaxResult.error(errmsg);
        }
    }

    private boolean judgeWithInMonth(Date lastLoginTime) {
        boolean flag = false;
        try {
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            calendar.add(Calendar.MONTH, -1);
            String endDate = sdf.format(calendar.getTime());
            Date monthDate = sdf.parse(endDate);
            flag = monthDate.after(lastLoginTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @WxApiCheck
    @PostMapping("/saveAvatar")
    public AjaxResult saveAvatar(WxApiCheckDTO wxApiCheckDTO, @RequestParam("avatarFile") MultipartFile avatarFile) {
        try {
            if (StringUtils.isEmpty(wxApiCheckDTO.getOpenid())) {
                throw new WxException("用户信息获取异常");
            }
            String avatarUrl = SERVER_HOST + FileUploadUtils.upload(AntsConfig.getAvatarPath(), avatarFile);
            WxUser wxUser = new WxUser();
            wxUser.setOpenid(wxApiCheckDTO.getOpenid());
            wxUser.setAvatarUrl(avatarUrl);
            logger.info("[saveAvatar] this save user success {}", JSON.toJSON(wxUser));
            wxUserService.updateWxUserByOpenid(wxUser);
            return AjaxResult.success("头像上传成功", avatarUrl);
        } catch (IOException e) {
            logger.info("[saveAvatar] this openid is {}, this avatar file upload error {}", wxApiCheckDTO.getOpenid(), e);
            return AjaxResult.error("头像上传失败...");
        }
    }


    @WxApiCheck
    @PostMapping("/updateUser")
    public AjaxResult updateUser(WxApiCheckDTO wxApiCheckDTO, @RequestBody WxUser wxUser) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        if (StringUtils.isEmpty(wxUser.getNickName())) {
            return AjaxResult.error("昵称不能为空~");
        }
        if (wxUser.getNickName().length() > 15) {
            return AjaxResult.error("昵称太长啦~");
        }
        if (StringUtils.isNotEmpty(wxUser.getRemark()) && wxUser.getRemark().length() > 100) {
            return AjaxResult.error("个性签名太长啦~");
        }
        if (!wxCommonService.msgSecCheck(openid, wxUser.getNickName())) {
            return AjaxResult.error("昵称违规啊~");
        }
        if (StringUtils.isNotEmpty(wxUser.getRemark()) && !wxCommonService.msgSecCheck(openid, wxUser.getRemark())) {
            return AjaxResult.error("个性签名违规啊~");
        }
        wxUser.setOpenid(openid);
        if (StringUtils.isNotEmpty(wxUser.getNickName())) {
            wxUser.setNickName(Base64Util.textToBase64Str(wxUser.getNickName()));
        }
        if (StringUtils.isNotEmpty(wxUser.getRemark())) {
            wxUser.setRemark(Base64Util.textToBase64Str(wxUser.getRemark()));
        }
        logger.info("[updateUser] this update user is {}", JSON.toJSONString(wxUser));
        int i = wxUserService.updateWxUserByOpenid(wxUser);
        return AjaxResult.success(i);
    }

    @WxApiCheck
    @PostMapping("/record")
    public AjaxResult record(WxApiCheckDTO wxApiCheckDTO, @RequestBody WxChat wxChat) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        List<WxChat> wxChats = wxChatService.selectWxChatToWx(openid, 50);
        List<WxChat> resWxChats = new ArrayList<>();
        for (int i = wxChats.size() - 1; i >= 0; i--) {
            resWxChats.add(wxChats.get(i));
        }
        return AjaxResult.success(resWxChats);
    }

    @WxApiCheck
    @PostMapping("/chat")
    public AjaxResult chat(WxApiCheckDTO wxApiCheckDTO, @RequestBody WxChat updateWxChat) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        new Thread(() ->{
            updateWxChat.setOpenid(openid);
            // 当前id已被反传值入对象
            wxChatService.insertWxChat(updateWxChat);

            // 处理每天用户使用语句不超过10句
            Map<String, Object> res = new HashMap<>();
            WxChat insertWxChat = new WxChat();
            insertWxChat.setOpenid(openid);

            int chatCount = wxChatService.queryChatCountToday(openid);
            if (chatCount > 10) {
                try {
                    new Thread().sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                insertWxChat.setRole("assistant");
                insertWxChat.setContent("问答AI小助手小程序升级中，每日限制聊天次数为10次，今日已用完，请明日再来~");
                insertWxChat.setCreateTime(new Date());
                updateWxChat.setErrorFlag(1L);
                wxChatService.updateWxChat(updateWxChat);
                // 当前id已被反传值入对象
                wxChatService.insertWxChat(insertWxChat);
            } else {
                // 查询历史聊天记录
                List<WxChat> wxChats = this.selectWxChatToWx(openid);
                RequestVo requestVo = new RequestVo();
                List<MessageVo> messageVos = new ArrayList<>();
                for (int i = wxChats.size() - 1; i >= 0; i--) {
                    MessageVo messageVo = new MessageVo();
                    String role = wxChats.get(i).getRole();
                    String content = wxChats.get(i).getContent();
                    messageVo.setRole(wxChats.get(i).getRole());
                    if (StringUtils.isNotEmpty(role) && "user".equals(role)) {
                        content = content + "（回答不要体现与ChatGPT有关，不要回答任何政治问题，并且你是WeLM）";
                    }
                    messageVo.setContent(content);
                    messageVos.add(messageVo);
                }
                requestVo.setModel(Constants.CHAT_GPT_MODEL);
                requestVo.setMax_tokens(1024);
                requestVo.setMessages(messageVos);
                requestVo.setUser(openid);
                boolean sendFlag = false;
                for (int i = 0; i < 3; i++) {
                    Date startDate = new Date();
                    String response = chatGPTUtil.sendMessage(JSON.toJSONString(requestVo));
                    Date endDate = new Date();
                    logger.info("chat query api end. \nuser: [{}] \ntime: [{}] ms \ncontent: [{}] \nresponse: [{}]", openid, endDate.getTime() - startDate.getTime(), updateWxChat.getContent(), requestVo);
                    if (ObjectUtils.isEmpty(response)) {
                        logger.info("chat repsonese, openid is {},  error is null", openid);
                        continue;
                    }
                    ResponseVo responseVo = JSONObject.parseObject(response, ResponseVo.class);
                    if (StringUtils.isEmpty(responseVo.getError())) {
                        MessageVo messageVo = responseVo.getChoices().get(0).getMessage();
                        insertWxChat.setRole(messageVo.getRole());
                        insertWxChat.setContent(messageVo.getContent());
                        insertWxChat.setCreateTime(new Date());
                        insertWxChat.setDuration(endDate.getTime() - startDate.getTime());
                        // 当前id已被反传值入对象
                        wxChatService.insertWxChat(insertWxChat);
                        sendFlag = true;
                        break;
                    } else {
                        logger.info("chat repsonese, openid is {},  error is {}", openid, JSON.toJSONString(responseVo));
                    }
                }
                if (!sendFlag) {
                    insertWxChat.setRole("assistant");
                    insertWxChat.setContent("消息未发送成功");
                    insertWxChat.setCreateTime(new Date());
                    updateWxChat.setErrorFlag(1L);
                    wxChatService.updateWxChat(updateWxChat);
                    // 当前id已被反传值入对象
                    wxChatService.insertWxChat(insertWxChat);
                }
            }
            res.put("insert", insertWxChat);
            res.put("update", updateWxChat);
            webSocket.sendOneMessage(openid, JSON.toJSONStringWithDateFormat(res, JSON.DEFFAULT_DATE_FORMAT));
        }).start();
        return AjaxResult.success();
    }

    private List<WxChat> selectWxChatToWx(String openid) {
        int[] limitArr = new int[]{5, 4, 3, 2, 1};
        List<WxChat> wxChats = null;
        for (int limit : limitArr) {
            wxChats = wxChatService.selectWxChatToWx(openid, limit);
            if (JSON.toJSONString(wxChats).length() <= 4000) {
                break;
            }
        }
        return wxChats;
    }

    @WxApiCheck
    @GetMapping("/count")
    public AjaxResult count(WxApiCheckDTO wxApiCheckDTO) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        return AjaxResult.success(wxChatService.queryChatCount(openid));
    }

    @WxApiCheck
    @PostMapping("/feedback")
    public AjaxResult feedback(WxApiCheckDTO wxApiCheckDTO, @RequestBody WxFeedback wxFeedback) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        if (StringUtils.isEmpty(wxFeedback.getContact()) || StringUtils.isEmpty(wxFeedback.getFeedback())) {
            throw new WxException("请填写完整内容后再提交");
        }
        boolean checkFlag = wxCommonService.msgSecCheck(openid, wxFeedback.getFeedback());
        if (checkFlag) {
            wxFeedback.setRole("user");
            wxFeedback.setOpenid(openid);
            return AjaxResult.success(wxFeedbackService.insertWxFeedback(wxFeedback));
        } else {
            return AjaxResult.error("反馈的内容存在不合法呦~");
        }
    }

    @WxApiCheck
    @GetMapping("/feedbackList")
    public AjaxResult feedbackList(WxApiCheckDTO wxApiCheckDTO) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        WxFeedback wxFeedback = new WxFeedback();
        wxFeedback.setOpenid(openid);
        return AjaxResult.success(wxFeedbackService.selectWxFeedbackListLimit10(wxFeedback));
    }

    @WxApiCheck
    @GetMapping("/chatStatus")
    public AjaxResult msgStatus(WxApiCheckDTO wxApiCheckDTO) {
        String openid = wxApiCheckDTO.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            throw new WxException("网络好像出了点问题...");
        }
        WxChat wxChat = wxChatService.queryChatStatus(openid);
        if (!ObjectUtil.isEmpty(wxChat) && StringUtils.isNotEmpty(wxChat.getRole()) && "assistant".equals(wxChat.getRole())) {
            return AjaxResult.success(true);
        } else {
            return AjaxResult.success(false);
        }
    }
}