package ez.web.service;

import java.util.List;

import ez.web.domain.BoardDTO;
import ez.web.domain.PageDTO;

public interface BoardService {
	// 게시판 리스트 가져오기
	public List<BoardDTO> getList(PageDTO pDto);
	
	// 등록
	public void register(BoardDTO board);
	
	// 게시글 상세보기
	public BoardDTO view(int bid, String mode);
	
	// 게시글 삭제
	public int remove(int bid);
	
	// 게시글 수정
	public int modify(BoardDTO board);
	
	// 전체 게시글 수
	public int totalCnt(PageDTO pDto);
	
	
}
