package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/comment/delete")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제할 댓글 번호를 가져옴
    	int num = 0;
    	try {
    		num = Integer.parseInt(request.getParameter("num"));
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	//회원 정보 가져옴
    	UserVO user = (UserVO) request.getSession().getAttribute("user");
    	boolean res = postService.deleteComment(num, user);
    	response.getWriter().write(res?"ok":"");
    	
	}

}
