package com.ants.framework.web.service;

import javax.annotation.Resource;

import com.ants.common.core.domain.entity.SysUser;
import com.ants.common.utils.SecurityUtils;
import com.ants.framework.manager.AsyncManager;
import com.ants.framework.manager.factory.AsyncFactory;
import com.ants.system.domain.SysUserRole;
import com.ants.system.mapper.SysUserRoleMapper;
import com.ants.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import com.ants.common.constant.Constants;
import com.ants.common.core.domain.model.LoginUser;
import com.ants.common.core.redis.RedisCache;
import com.ants.common.exception.CustomException;
import com.ants.common.exception.user.CaptchaException;
import com.ants.common.exception.user.CaptchaExpireException;
import com.ants.common.exception.user.UserPasswordNotMatchException;
import com.ants.common.utils.MessageUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 登录校验方法
 * 
 * @author ants
 */
@Component
public class SysLoginService
{
    @Autowired
    private TokenService tokenService;

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    /**
     * 登录验证
     * 
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public String login(String username, String password, String code, String uuid)
    {
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
            throw new CaptchaException();
        }
        // 用户验证
        Authentication authentication = null;
        try
        {
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager
                    .authenticate(new UsernamePasswordAuthenticationToken(username, password));
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new CustomException(e.getMessage());
            }
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        // 生成token
        return tokenService.createToken(loginUser);
    }

    /**
     * 注册验证
     *
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public Map<String,Object> register(String username, String password, String pass, String code, String uuid)
    {
        Map<String,Object> map = new HashMap<>();
        if(password==null || pass == null) {
            map.put("msg","密码不能为空");
            map.put("code",201);
            return map;
        }
        if(!password.equals(pass)) {
            map.put("msg","密码重复输入不一致");
            map.put("code",201);
            return map;
        }
        SysUser sysUser = userService.selectUserByUserName(username);
        if(sysUser != null) {
            map.put("msg","注册用户名已存在");
            map.put("code",201);
            return map;
        }
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
            throw new CaptchaException();
        }
        SysUser user = new SysUser();
        user.setDeptId(103L);
        user.setUserName(username);
        user.setNickName(username);
        user.setEmail("");
        user.setPhonenumber("");
        user.setSex("1");
        user.setPassword(SecurityUtils.encryptPassword(password));
        user.setStatus("0");
        user.setDelFlag("0");
        user.setCreateBy("admin");
        if(userService.insertUser(user)>0){
            SysUser user1 = userService.selectUserByUserName(username);
            // 分配用户权限
            List<SysUserRole> userRoleList = new ArrayList<>();
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(user1.getUserId());
            sysUserRole.setRoleId(2L);
            userRoleList.add(sysUserRole);
            sysUserRoleMapper.batchUserRole(userRoleList);
            map.put("msg","注册成功");
            map.put("code",200);
            return map;
        } else {
            map.put("msg","注册失败");
            map.put("code",201);
            return map;
        }
    }
}
