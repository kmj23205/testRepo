package ez.web.bbs06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ez.web.domain.ReplyDTO;
import ez.web.domain.ReplyPageDTO;
import ez.web.service.ReplyService;

@RestController // @Controller + @ResponseBody
@RequestMapping("/replies")
public class ReplyController {
	
	//ResponseEntity 클래스는 리턴시에 Http 상태코드를 데이터와 함께 반환해주는 클래스
	// 상태코드, 헤더값을 모두 frontEnd에 전송해준다.
	//@PathVariable url에서 가변인자에 해당하는 값을 수집
		
	@Autowired
	private ReplyService service;
	
	// 댓글 조회
	@GetMapping(value = "/{rno}",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyDTO> get(@PathVariable("rno") int rno){
		System.out.println("rno : " + rno);
		return new ResponseEntity<ReplyDTO>(service.read(rno), HttpStatus.OK);
	}
	
	// 댓글 추가
	// consumes : 들어오는 데이터 타입을 정의하는 속성
	// produces : 반환하는 데이터 타입을 정의하는 속성
	@PostMapping(value="/new",
			consumes = MediaType.APPLICATION_JSON_UTF8_VALUE,
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyDTO rDto){
		System.out.println(rDto);
		
		int resultCnt = service.register(rDto);
		
		return resultCnt == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) 
			: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 삭제
	@DeleteMapping(value = "/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") int rno){		
		
		int resultCnt = service.remove(rno);
		
		return resultCnt == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) 
			: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 수정
	@RequestMapping(value = "/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH},
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@PathVariable("rno") int rno, @RequestBody ReplyDTO rDto){		
		
		rDto.setRno(rno);
		int resultCnt = service.modify(rDto);	
		
		return resultCnt == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) 
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 특정 게시글의 댓글 목록을 가져오기
//	@GetMapping(value="/rList/{bid}")
//	public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("bid") Integer bid){
//		List<ReplyDTO> list = service.getList(bid);
//		System.out.println("list : " + list);
//		
//		return new ResponseEntity<List<ReplyDTO>>(list, HttpStatus.OK);
//	}
	
	@GetMapping(value="/rList/{bid}/{viewPage}")
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bid") Integer bid,
			@PathVariable("viewPage") Integer viewPage){
		
		ReplyPageDTO repDto = service.getList(bid, viewPage);
		// repDto안에는 pagination에 필요한 정보와 viewPage에 대한 댓글리스트가 포함
		System.out.println("repDto : " + repDto);
		
		return new ResponseEntity<ReplyPageDTO>(repDto, HttpStatus.OK);
	}
}
