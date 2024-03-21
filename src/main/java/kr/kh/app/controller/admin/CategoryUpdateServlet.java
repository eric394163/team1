package kr.kh.app.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.app.model.vo.CategoryVO;
import kr.kh.app.service.CategoryService;
import kr.kh.app.service.CategoryServiceImp;

//관리자페이지 - 카테고리 수정/삭제 서블릿
@WebServlet("/admin/categoryupdate")
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryService categoryService = new CategoryServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> categoryList = categoryService.getCategoryList(); //카테고리 리스트 불러오기
		request.setAttribute("categoryList", categoryList);//화면에 전송
		
		request.getRequestDispatcher("/WEB-INF/views/admin/categoryUpdate.jsp").forward(request, response);
	}
}
