package com.penghai.ljq;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class remeber implements HandlerInterceptor {

    // Controller执行前调用此方法 方法前
    // 返回true表示继续执行，返回false中止执行
    // 这里可以加入登录校验、权限拦截
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String username = (String) request.getSession().getAttribute("username");
        if(username==null||username==""||username.length()==0){
            response.sendRedirect(request.getContextPath()+"/demo/login");
            return  false;
        }
        return true;}
    // controller执行后但未返回视图前调用此方法  方法后
    // 这里可在返回用户前对模型数据进行加工处理，比如这里加入公用信息以便页面显示
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }
    // controller执行后且视图返回后调用此方法 页面渲染后
    // 这里可得到执行controller时的异常信息
    // 这里可记录操作日志
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
