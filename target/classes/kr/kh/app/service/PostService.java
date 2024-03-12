package kr.kh.app.service;

import java.util.ArrayList;

import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;

public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post);
	
}