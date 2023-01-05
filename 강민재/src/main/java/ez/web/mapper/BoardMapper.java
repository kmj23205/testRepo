package ez.web.mapper;

import java.util.List;

import ez.web.domain.BoardDTO;
import ez.web.domain.PageDTO;

//Persistent Layer(영속성 계층)
public interface BoardMapper {
	// 게시판 리스트 가져오기
	public List<BoardDTO> getList(PageDTO pDto);
	
	// 등록
	public void insert(BoardDTO board);
	
	// 게시글 상세보기
	public BoardDTO view(int bid);
	
	// 게시글 삭제
	public int delete(int bid);
	
	// 게시글 수정
	public int update(BoardDTO board);
	
	// 조회수 업데이트
	public void hitAdd(int bid);
	
	// 전체 게시글 수
	public int totalCnt(PageDTO pDto);
	
}
