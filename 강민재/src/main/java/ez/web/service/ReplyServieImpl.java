package ez.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ez.web.domain.ReplyDTO;
import ez.web.domain.ReplyPageDTO;
import ez.web.mapper.ReplyMapper;

@Service
public class ReplyServieImpl implements ReplyService{

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyDTO rDto) {
		
		return mapper.insert(rDto);
	}

	@Override
	public ReplyDTO read(int ron) {
		return mapper.select(ron);
	}

	@Override
	public int modify(ReplyDTO rDto) {
		return mapper.update(rDto);
	}

	@Override
	public int remove(int rno) {
		return mapper.delete(rno);
	}
	
//	@Override
//	public List<ReplyDTO> getList(Integer bid) {		
//		return mapper.getListByBid(bid);
//	}
	
	@Override
	public ReplyPageDTO getList(Integer bid, Integer viewPage) {
		// 댓글 수 구하기
		int replyCnt = mapper.replyCnt(bid);
		ReplyPageDTO repDto = new ReplyPageDTO();
		// viewPage가 바뀔때마다 새롭게 셋팅
		repDto.setViewPage(viewPage);
		// startIndex가 새롭게 셋팅
		repDto.setValue(replyCnt);
		
		// repDto와 bid는 서로 다른 객체이므로 myBatis에서 두 객체를 모두 인식할 수 없음.
		//List<ReplyDTO> list = mapper.getListByBid(bid, repDto);
		
		List<ReplyDTO> list = mapper.getListByBid(bid, repDto.getStartIndex(), 
				repDto.getCntPerPage());
		
		// 댓글 리스트를 repDto에 셋팅해줌
		repDto.setList(list);
		
		return repDto;
	}

	@Override
	public int replyCnt(Integer bid) {		
		return mapper.replyCnt(bid);
	}
	
	
	
}
