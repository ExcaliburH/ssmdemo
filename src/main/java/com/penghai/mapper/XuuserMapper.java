package com.penghai.mapper;

import com.penghai.pojo.xuuser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface XuuserMapper {
    public void userRegist(xuuser xu);//注册
    public int selectByN(xuuser xuuser);//登录
    public List<xuuser> selectAll();//登录成功
    public xuuser selectUser(int id); //修改前查询用户信息
    public int updateUser(xuuser xuuser);//更新信息
    public int updatePd(xuuser xuuser);//重置密码
    public int deleteUser(int id);
    public int checkName(String username);
    public int checkPhone(String phonenum);

}
