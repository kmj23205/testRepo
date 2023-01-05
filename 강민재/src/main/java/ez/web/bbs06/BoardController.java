package ez.web.bbs06;

import java.io.Writer;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ez.web.domain.BoardDTO;
import ez.web.domain.PageDTO;
import ez.web.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
//	@Autowired
//	private PageDTO pdto;
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute("pDto") PageDTO pDto,
			
					  // @ModelAttribute("bDto") BoardDTO bDto,
			
			// @RequestParam(defaultValue = "1") int viewPage, 
//			 @RequestParam(defaultValue = "10") int cntPerPage,
			Model model) {

		// 전체 게시글 수
//		int totalCnt = service.totalCnt();
//		pDto.setCntPerpage(cntPerPage);
//		pDto.setValue(totalCnt, cntPerPage);
		System.out.println("searchType : " + pDto.getSearchType());
		System.out.println("keyWord : " + pDto.getKeyWord());
		
		List<BoardDTO> list=service.getList(pDto);
		
		
		model.addAttribute("list", list);
//		model.addAttribute("pDto", pDto);
		return "board/boardList";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String registerForm() {
		return "board/register";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register(BoardDTO board) {
//		for(int i=1; i<=110; i++) {
//			BoardDTO dto = new BoardDTO();
//			dto.setSubject(i + "번째 제목입니다....");
//			dto.setContents(i + "번째 내용입니다....");
//			dto.setWriter("아무개"+(i%10));
//			
//			service.register(dto);
//		}
		
		service.register(board);
		
		return "redirect:/list.do";
	}
	
	@RequestMapping("/view.do")
//	public String view(int bid, int viewPage, Model model) {
	public String view(int bid, @ModelAttribute("pDto") PageDTO pDto, Model model) {
//		BoardDTO board = service.view(bid);
		BoardDTO board = service.view(bid, "view");
		model.addAttribute("board", board);
//		model.addAttribute("viewPage", viewPage);
		
		return "board/view"; //view.jsp
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String modifyForm(int bid, @ModelAttribute("pDto") PageDTO pDto, Model model) {
		BoardDTO board = service.view(bid, "modify");
		model.addAttribute("board", board);
//		model.addAttribute("viewPage", viewPage);
		
		return "board/modify"; // modify.jsp
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(BoardDTO board, @ModelAttribute("pDto") PageDTO pDto, 
			RedirectAttributes reAttr) {
		
		System.out.println("keyWord~~~ : "+ pDto.getKeyWord());
		System.out.println("searchType~~~ : "+ pDto.getSearchType());
//		System.out.println(board);
		service.modify(board);
		
//		model.addAttribute("pDto", pDto);
		reAttr.addAttribute("viewPage", pDto.getViewPage());
		reAttr.addAttribute("searchType", pDto.getSearchType());
		reAttr.addAttribute("keyWord", pDto.getKeyWord());
		
		return "redirect:/list.do";
	}
	
	@RequestMapping("/remove.do")
	public String remove(int bid, @ModelAttribute("pDto") PageDTO pDto, Model model,
			RedirectAttributes reAttr) {
		
		service.remove(bid);
		
		// redirect 시에는 파라미터 전송시에 Model에 담겨 전송안됨.
		// RedirectAttributes 객체를 이용해서 전송
//		model.addAttribute("viewPage", viewPage);
		reAttr.addAttribute("viewPage", pDto.getViewPage());
		reAttr.addAttribute("searchType", pDto.getSearchType());
		reAttr.addAttribute("keyWord", pDto.getKeyWord());
		
		return "redirect:/list.do";
	}
}
