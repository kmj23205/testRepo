package ez.web.domain;

import java.util.List;

import lombok.Data;

@Data
public class ReplyPageDTO {
	private int totalCnt; // 특정 게시글에 대한 댓글 전체개수
	private int viewPage = 1;
	private int blockSize = 5;
	private int blockNum;
	private int blockStart;
	private int blockEnd;
	private int prevPage;
	private int nextPage;
	private int totalPage;
	
	private int startIndex;
	private int cntPerPage = 5;
	
	private List<ReplyDTO> list;
		
	
	public ReplyPageDTO() {}
	
//	public void setValue(int totalCnt, int cntPerPage) {
	public void setValue(int totalCnt) {
		// 전체 페이지 수
		this.totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);
		// 페이지별 시작 인덱스 : 0, 10, 20, 30,....
		this.startIndex = (viewPage-1)*cntPerPage;
		// 현재 페이지의 블럭 위치 : 0부터 시작
		this.blockNum = (viewPage-1)/blockSize;
		
		// 블럭의 시작값 : 1, 6, 11,...
		this.blockStart = (blockSize*blockNum)+1;		
		// 블럭의 마지막값 : 5, 10, 15,...
		this.blockEnd = blockStart + (blockSize - 1);
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		// 이전페이지
		this.prevPage = blockStart - 1;
		// 다음페이지
		this.nextPage = blockEnd + 1;
		// 전체페이지 수를 초과할 수 없도록
		if(nextPage > totalPage) nextPage = totalPage;
	}
	
	
}
