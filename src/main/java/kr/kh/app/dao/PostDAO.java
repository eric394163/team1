package kr.kh.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface PostDAO {

	ArrayList<BoardVO> selectBoardList();

	boolean insertPost(@Param("post") PostVO post);

	int selectTotalPostCount(@Param("cri") Criteria cri);

	ArrayList<PostVO> selectTotalSearchResultList(@Param("cri") Criteria cri);

	ArrayList<PostVO> selectTotalPostList(@Param("cri") Criteria cri);

	int selectTotalCount(@Param("cri") Criteria cri);

	PostVO selectPost(@Param("num") int num);

	ArrayList<AttachVO> selectFileByPost_id(@Param("num") int num);

	void insertFile(@Param("attach")AttachVO attachVo);

	void insertLink(@Param("attach")AttachVO attach);
	
	
}
