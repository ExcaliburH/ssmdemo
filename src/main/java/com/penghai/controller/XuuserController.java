package com.penghai.controller;

import com.penghai.pojo.xuuser;
import com.penghai.service.XuuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller  //将对象注册到容器中 web层
@RequestMapping("demo")
public class XuuserController {
    @Autowired //自动注入
    private XuuserService xuuserService;
    //进入页面
    @RequestMapping("login") //@RequestMapping：定义请求url到处理器功能方法的映射
    public String userLogin() {
        return "tortime";
    }
     //注册
    @RequestMapping("userRegist")
    public String userRegist(xuuser xu) {
        //获取注册时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String ctime = simpleDateFormat.format(new Date());
        //设置注册时间
        xu.setRtime(ctime);
        xuuserService.userRegist(xu);
        return "redirect:success";
    }
    //登录
    @RequestMapping("userLogin")
    public String userLogin(xuuser xuuser, Model model,HttpSession session) {
       /* Model是一个接口 Model对象可以向页面传递数据
        View对象则可以使用String返回值替代
        model.addAttribute(String nama,值）添加数据*/
       //如果提交的参数很多，或者提交的表单中的内容很多的时候,一个的时候也可以,可以使用简单类型接受数据,也可以使用pojo接收数据。要求：pojo对象中的属性名和表单中input的name属性一致。
        int i = xuuserService.selectByN(xuuser);// 0
        if (i < 0) {
            String info = "shibai";
            model.addAttribute("info", info);
            return "forward:/WEB-INF/jsp/toritme.jap";//请求转发foward 携带数据
        }
        //添加session
        session.setAttribute("username",xuuser.getUsername());
        return "redirect:success";//重定向不携带数据Redirect
    }
    //登录成功
    @RequestMapping("success")
    public String showInfo(Model model) {
        //查询所有
        List<xuuser> list = xuuserService.selectAll();
        model.addAttribute("list", list);
        return "success";
    }
    //修改前查询用户信息
    @ResponseBody//@ResponseBody注解用于将Controller的方法返回的对象，通过springmvc提供的HttpMessageConverter接口转换为指定格式的数据如：json,xml等，通过Response响应给客户端
    @RequestMapping("selectUser")
    public xuuser selectUser(int id) {
        //当请求的参数名称和处理器形参名称一致时会将请求参数与形参进行绑定。
        xuuser xuuser = xuuserService.selectUser(id);
        return xuuser;
    }
    //更新信息
    @ResponseBody
    @RequestMapping("updataUser")
    public boolean updataUser(xuuser xuuser) {
        boolean b = xuuserService.updataUser(xuuser);
        System.out.println(b); //true
        return b;
    }
    //重置密码
    @ResponseBody
    @RequestMapping("updatePd")
    public boolean updatePd(xuuser xuuser) {
        boolean b = xuuserService.updatePd(xuuser);
        return b;
    }
    //删除用户
    @ResponseBody
    @RequestMapping("deleteUser")
    public boolean deleteUser(int id) {
        boolean b = xuuserService.deleteUser(id);
        return b;
    }

    //判断用户名是否重复
    @ResponseBody
    @RequestMapping("name")
    public boolean checkName(String username) {
        boolean i = xuuserService.checkName(username);
        return i;
    }
    //判断密码是否重复
    @ResponseBody
    @RequestMapping("phone")
    public boolean checkPhone(String phonenum) {
        boolean b = xuuserService.checkPhone(phonenum);
        return b;
    }
     //设置session失效
     @RequestMapping("delectSeesion")
     public String delectSeesion(HttpSession session){
        session.removeAttribute("username");
        return "tortime";
     }
}
