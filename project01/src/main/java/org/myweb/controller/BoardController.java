package org.myweb.controller;

import org.myweb.domain.BoardVO;
import org.myweb.domain.Criteria;
import org.myweb.domain.PageDTO;
import org.myweb.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller // 스프링 빈으로 인식할 수 있게 하는 어노테이션
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	// 주입 처리를 해야 tests JUnit 잘돌아감. 안해서 한참 헤맸으니 다음부턴 먼저 해놓기
	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list");
//		
//		model.addAttribute("list", service.getList());
//	}

	@GetMapping("/list")
	public void list(Criteria criteria, Model model) {
		int total = service.getTotalData(criteria);
		log.info("\n===========================\ntotalData:" + total + "\n==========================");
		log.info("list: " + criteria);
		
		if(total==0) {
			model.addAttribute("fail", "fail");
		}
		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
	}

	// 같은 경로도 get, post로 나눠서 처리 가능
	// register()는 입력페이지를 보여주는 역할뿐이기 때문에
	// 별도의 처리가 필요하지 않음
	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("register: " + board);

		service.register(board);

		rttr.addFlashAttribute("result", board.getBoard_no());

		return "redirect:/board/list";

	}

	// mapping시 URL 배열 처리 가능
	@GetMapping({ "/get", "/modify" })	// 페이지 번호 유지용 @ModelAttribute
	public void get(@RequestParam("board_no") Long board_no, @ModelAttribute("criteria") Criteria criteria, Model model) {
		// ModelAttribute는 자동으로 Model에
		// 지정한 이름으로 데이터를 담아줌
		// 사용하지 않아도 파라미터가 된 객체는 전달되잠ㄴ 좀 더 명시적으로 이름을 지정하기 위해 사용함
		log.info("/get || /modify");
		model.addAttribute("board", service.get(board_no));
		
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) {

		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
	
		return "redirect:/board/list" + criteria.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("board_no") Long board_no, @ModelAttribute("criteria") Criteria criteria, RedirectAttributes rttr) {

		log.info("remove: " + board_no);

		if (service.remove(board_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list" + criteria.getListLink();
	}

}
