package kr.kh.app.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.kh.app.model.vo.AttachVO;
import kr.kh.app.model.vo.BlockedVO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.CommentVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.model.vo.ReportVO;
import kr.kh.app.model.vo.UserVO;
import kr.kh.app.pagination.CommentCriteria;
import kr.kh.app.pagination.Criteria;

public interface PostService {

	ArrayList<BoardVO> getBoardList();

	boolean insertPost(PostVO post, ArrayList<Part> partList, AttachVO attach);

	ArrayList<PostVO> getTotalPostList(Criteria cri); // 전체 게시글 조회

	int getTotalCount(Criteria cri);

	PostVO getPost(int num);

	ArrayList<AttachVO> getFile(int num);

	AttachVO getLink(int num);
	
	int getTotalPostCount(Criteria cri);

	ArrayList<PostVO> getTotalSearchResultList(Criteria cri);

	boolean updateBoard(PostVO post, UserVO user, String[] nums, ArrayList<Part> fileList);

	boolean deletePost(int num, UserVO user);

    ArrayList<PostVO> getPopularViewPostList(Criteria cri);

	ArrayList<PostVO> getPopularLikePostList(Criteria popularLikeCri);

	boolean updateAttach(PostVO post, UserVO user, String link, AttachVO attach);

	int like(int post_id, int upvote, UserVO user);

	boolean updatePostView(int num);
    int getReportedPostCount(Criteria cri);

	ArrayList<PostVO> getReportedPostList(Criteria cri);
	boolean insertComment(CommentVO comment);

	ArrayList<CommentVO> getCommentList(Criteria cri);

	int getTotalCountComment(Criteria cri);

	boolean deleteComment(int num, UserVO user);

	boolean updateComment(CommentVO comment);

	int getPostReportedListCount(Criteria cri);

    ArrayList<ReportVO> getPostReportedList(Criteria cri);

	ArrayList<CommentVO> getTotalCommentList(int post_num);

	boolean insertuserBlocked(BlockedVO blocked);
    boolean deletePost(int num);

	int getVoteCount(int post_id);

	boolean reportPost(ReportVO report);

    void updateReportCount(int post_id);



}
