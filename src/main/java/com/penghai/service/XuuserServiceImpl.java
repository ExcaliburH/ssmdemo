package com.penghai.service;

import com.penghai.mapper.XuuserMapper;
import com.penghai.pojo.xuuser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service  //将对象注册到容器 注册到service层
public class XuuserServiceImpl implements XuuserService {
    @Autowired //自动注入 引用类型注入
    private XuuserMapper xuuserMapper;
    //注册
    public void userRegist(xuuser xu) {

        xuuserMapper.userRegist(xu);
    }
    //登录
    public int selectByN(xuuser xuuser) {
        int i = xuuserMapper.selectByN(xuuser);
        System.out.println(i); // 0
        return i;
    }
    //登录成功 查询所有
    public List<xuuser> selectAll() {

        return xuuserMapper.selectAll();
    }
    //修改前查询用户信息
    public xuuser selectUser(int id) {
        xuuser xuuser = xuuserMapper.selectUser(id);

        return xuuser;
    }
    //更新信息
    public boolean updataUser(xuuser xuuser) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String ctime = simpleDateFormat.format(new Date());
        xuuser.setCtime(ctime);
        int i = xuuserMapper.updateUser(xuuser);
        System.out.println(i); //1
        return i>0?true:false;
    }
    //重置密码
    public boolean updatePd(xuuser xuuser) {
        String password="123456";
        xuuser.setPassword(password);
        int i = xuuserMapper.updatePd(xuuser);
        return i>0?true:false;
    }

    public boolean deleteUser(int id) {
        int i = xuuserMapper.deleteUser(id);
        return i>0?true:false;
    }

    public boolean checkName(String username) {
        int i = xuuserMapper.checkName(username);
        return i>0?true:false;
    }

    public boolean checkPhone(String phonenum) {
        int i = xuuserMapper.checkPhone(phonenum);
        return i>0?true:false;
    }




}
