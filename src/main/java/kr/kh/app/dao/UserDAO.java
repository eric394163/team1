package kr.kh.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.UserVO;

public interface UserDAO {

    UserVO selectUser(@Param("user_id") String id);

}