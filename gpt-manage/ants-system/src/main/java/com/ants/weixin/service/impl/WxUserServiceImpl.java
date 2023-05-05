package com.ants.weixin.service.impl;

import java.util.List;
import com.ants.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ants.weixin.mapper.WxUserMapper;
import com.ants.weixin.domain.WxUser;
import com.ants.weixin.service.IWxUserService;

/**
 * 微信用户Service业务层处理
 * 
 * @author ants
 * @date 2022-10-22
 */
@Service
public class WxUserServiceImpl implements IWxUserService
{
    @Autowired
    private WxUserMapper wxUserMapper;

    /**
     * 查询微信用户
     * 
     * @param id 微信用户ID
     * @return 微信用户
     */
    @Override
    public WxUser selectWxUserById(Long id)
    {
        return wxUserMapper.selectWxUserById(id);
    }

    /**
     * 查询微信用户列表
     * 
     * @param wxUser 微信用户
     * @return 微信用户
     */
    @Override
    public List<WxUser> selectWxUserList(WxUser wxUser)
    {
        return wxUserMapper.selectWxUserList(wxUser);
    }

    /**
     * 查询学习总数量
     *
     * @param openid openid
     * @return
     */
    @Override
    public Integer selectWxUserListGroupOpenid(String openid) {
        return wxUserMapper.selectWxUserListGroupOpenid(openid);
    }

    /**
     * 新增微信用户
     * 
     * @param wxUser 微信用户
     * @return 结果
     */
    @Override
    public int insertWxUser(WxUser wxUser)
    {
        wxUser.setCreateTime(DateUtils.getNowDate());
        return wxUserMapper.insertWxUser(wxUser);
    }

    /**
     * 修改微信用户
     * 
     * @param wxUser 微信用户
     * @return 结果
     */
    @Override
    public int updateWxUser(WxUser wxUser)
    {
        wxUser.setUpdateTime(DateUtils.getNowDate());
        return wxUserMapper.updateWxUser(wxUser);
    }

    /**
     * 修改微信用户
     *
     * @param wxUser 微信用户
     * @return 结果
     */
    @Override
    public int updateWxUserByOpenid(WxUser wxUser) {
        return wxUserMapper.updateWxUserByOpenid(wxUser);
    }

    /**
     * 批量删除微信用户
     * 
     * @param ids 需要删除的微信用户ID
     * @return 结果
     */
    @Override
    public int deleteWxUserByIds(Long[] ids)
    {
        return wxUserMapper.deleteWxUserByIds(ids);
    }

    /**
     * 删除微信用户信息
     * 
     * @param id 微信用户ID
     * @return 结果
     */
    @Override
    public int deleteWxUserById(Long id)
    {
        return wxUserMapper.deleteWxUserById(id);
    }

    /**
     * 查询有效用户
     *
     * @param openid openid
     * @return 用户
     */
    @Override
    public WxUser selectWxUserByOpenid(String openid) {
        return wxUserMapper.selectWxUserByOpenid(openid);
    }
}
