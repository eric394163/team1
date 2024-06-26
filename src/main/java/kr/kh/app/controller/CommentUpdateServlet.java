package kr.kh.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.service.PostService;
import kr.kh.app.service.PostServiceImp;

@WebServlet("/comment/update")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 보낸 댓글 내용과 댓글 번호를 가져옴
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		String content = request.getParameter("content");
		
		//회원 정보를 가져옴
		UserVO user = (UserVO)request.getSession().getAttribute("user");
		//댓글 객체를 댓글 번호, 내용, 작성자를 이용하여 생성
		CommentVO comment = new CommentVO(0, content, user.getUser_id());
		comment.setComment_id(num);
		//댓글을 수정하라고 시키고 결과를 boolean으로 받아옴
		boolean res = postService.updateComment(comment);
		response.getWriter().write(res?"ok":"");
	}

}
