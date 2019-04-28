package com.penghai.service;

import com.penghai.pojo.xuuser;

import java.util.List;

public interface XuuserService {
    public void userRegist(xuuser xu);//注册
    public int  selectByN(xuuser xuuser);//登录
    public List<xuuser> selectAll();//登录成功查询所有
    public xuuser selectUser(int id); //修改前查询用户信息
    public boolean  updataUser(xuuser xuuser);//更新信息
    public boolean  updatePd(xuuser xuuser );//重置密码
   public boolean    deleteUser(int id);
   public  boolean checkName(String username);
   public boolean checkPhone(String phonenum);


}
