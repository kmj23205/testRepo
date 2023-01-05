package ez.web.service;

import java.util.List;

import ez.web.domain.ReplyDTO;
import ez.web.domain.ReplyPageDTO;

public interface ReplyService {
	public int register(ReplyDTO rDto);
	
	public ReplyDTO read(int rno);
	
	public int modify(ReplyDTO rDto);
	
	public int remove(int rno);
	
//	public List<ReplyDTO> getList(Integer bid);
	public ReplyPageDTO getList(Integer bid, Integer viewPage);
	
	public int replyCnt(Integer bid);
}
