package kr.kh.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.app.dao.BoardDAO;
import kr.kh.app.model.vo.BoardVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.BoardListCriteria;
import kr.kh.app.pagination.Criteria;

public class BoardServiceImp implements BoardService{

	private BoardDAO boardDao;
	
	public BoardServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectTotalCount(cri);
	}

	@Override
	public ArrayList<PostVO> getBoardList(Criteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectBoardList(cri);
	}

	//클릭해서 넘어온 게시판번호의 게시명을 가져올 서비스 명령
	@Override
	public BoardVO getSubBoard(int board_id) {
		return boardDao.selectSubBoard(board_id);
	}

	@Override
	public int getCommentPostCount(Criteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectCommentPostCount(cri);
	}

	@Override
	public ArrayList<PostVO> getCommentPostList(Criteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectCommentPostList(cri);
	}

	@Override
	public int getLikePostCount(Criteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectLikePostCount(cri);
	}

	@Override
	public ArrayList<PostVO> getLikePostList(Criteria cri) {
		if(cri == null) {
			cri = new BoardListCriteria();
		}
		return boardDao.selectLikePostList(cri);
	}

	@Override
	public boolean insertBoard(BoardVO board) throws Exception {
		if(board == null ||
			!checkString(board.getBoard_name())) {
			return false;
		}
		if (boardDao.selectBoardByName(board.getBoard_name()) != null) {
			throw new Exception("게시판 이름이 중복됩니다.");
		}
		return boardDao.insertBoard(board);
	}

	@Override
	public ArrayList<BoardVO> getCaBoardList(int ca_num) {
		return boardDao.selectCaBoardList(ca_num);
	}

	@Override
	public boolean deleteBoard(int board_id) {
		return boardDao.deleteBoard(board_id);
	}

	@Override
	public boolean updateBoard(BoardVO board) {
		return boardDao.updateBoard(board);
	}
}
