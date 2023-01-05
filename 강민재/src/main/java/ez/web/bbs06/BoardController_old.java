package ez.web.bbs06;
//package ez.web.bbs02;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import ez.web.domain.BoardDTO;
//import ez.web.service.BoardService;
//
//@Controller
//public class BoardController_old {
//	// list.do(get) ---> list()
//	// register.do(post) --> register()
//	// view.do(get) --> view()
//	// remove.do(get) --> remove()
//	// modify.do(post) -->modify()
//	
//	@Autowired
//	private BoardService service;
//	
//	@RequestMapping("/list.do")
////	public String list(BoardDTO dto, Model model) {
//	public String list(BoardDTO dto, 
//			@RequestParam(defaultValue = "1") int viewPage, 
//			@RequestParam(defaultValue = "10") int cntPerPage,
//			Model model) {
////////////////////////////////////////
//		// 전체 게시글 수
//		int totalCnt = service.totalCnt();
//		System.out.println("totalCnt : " + totalCnt);
//		
////		// 사용자가 클릭한 페이지, 첫페이지
//		//int viewPage = 7;
////		
////		// 한페이지당 게시글 수
////		int cntPerPage = 10;
////		
////		// 전체 페이지 수
//		int totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);
//		System.out.println("전체 페이지수 : " + totalPage);
//		
//		// 페이지별 시작 인덱스 : 0, 10, 20, 30,....
//		int startIndex = (viewPage-1)*cntPerPage;
//		
////		dto.setViewPage(viewPage);
//		
//		dto.setCntPerpage(cntPerPage);
//		dto.setStartIndex(startIndex);
//		
//		List<BoardDTO> list=service.getList(dto);
////		
////		
////		//---------- pagination ----------
////		// 한블럭에 보여줄 페이지 버튼
//		int blockSize = 5;
////		
////		// 현재 페이지의 블럭 위치 : 0부터 시작
//		int blockNum = (viewPage-1)/blockSize;
////		
////		// 블럭의 시작값 : 1, 6, 11,...
//		int blockStart = (blockSize*blockNum)+1;
////		
////		// 블럭의 마지막값 : 5, 10, 15,...
//		int blockEnd = blockStart + (blockSize - 1);
////		
////		// 이전페이지
//		int prevPage = blockStart - 1;
////		
////		// 다음페이지
//		int nextPage = blockEnd + 1;
//		
//		// 전체페이지 수를 초과할 수 없도록
//		if(nextPage > totalPage) nextPage = totalPage;
//		
//		dto.setBlockStart(blockStart);
//		dto.setBlockEnd(blockEnd);
//		dto.setTotalPage(totalPage);
//		dto.setPrevPage(prevPage);
//		dto.setNextPage(nextPage);
//		
////		model.addAttribute("blockStart", blockStart);
////		model.addAttribute("blockEnd", blockEnd);
////		model.addAttribute("prevPage", prevPage);
////		model.addAttribute("nextPage", nextPage);
////		model.addAttribute("totalPage", totalPage);
////		model.addAttribute("viewPage", viewPage);
//		
//		model.addAttribute("dto", dto);
//		
////////////////////////////////////////
//		
//		
//		
//		model.addAttribute("list", list);
//		return "board/boardList";
//	}
//	
//	@RequestMapping(value="/register.do", method=RequestMethod.GET)
//	public String registerForm() {
//		return "board/register";
//	}
//	
//	@RequestMapping(value="/register.do", method=RequestMethod.POST)
//	public String register(BoardDTO board) {
////		for(int i=1; i<=110; i++) {
////			BoardDTO dto = new BoardDTO();
////			dto.setSubject(i + "번째 제목입니다....");
////			dto.setContents(i + "번째 내용입니다....");
////			dto.setWriter("아무개"+(i%10));
////			
////			service.register(dto);
////		}
//		
//		service.register(board);
//		
//		return "redirect:/list.do";
//	}
//	
//	@RequestMapping("/view.do")
//	public String view(int bid, Model model) {
////		BoardDTO board = service.view(bid);
//		BoardDTO board = service.view(bid, "view");
//		model.addAttribute("board", board);
//		
//		return "board/view"; //view.jsp
//	}
//	
//	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
//	public String modifyForm(int bid, Model model) {
//		BoardDTO board = service.view(bid, "modify");
//		model.addAttribute("board", board);
//		
//		return "board/modify"; // modify.jsp
//	}
//	
//	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
//	public String modify(BoardDTO board) {
//		System.out.println(board);
//		service.modify(board);
//		
//		return "redirect:/list.do";
//	}
//	
//	@RequestMapping("/remove.do")
//	public String remove(int bid) {
//		service.remove(bid);
//		return "redirect:/list.do";
//	}
//}
