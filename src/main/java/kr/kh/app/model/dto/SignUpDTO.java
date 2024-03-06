package kr.kh.app.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SignUpDTO { //UserVO 와 동일하면 VO로만 사용해도 됨, UserVO 에는 user_id 이렇게 있지만 SignUpDTO에는 id로 사용해서 프로그램변수명을 숨길 수 있음

    private String id;
    private String pw;
    private String nickname;
    private String email;
    private Date birth;
    private Date state_date;
    private String role;
    private String state;

}