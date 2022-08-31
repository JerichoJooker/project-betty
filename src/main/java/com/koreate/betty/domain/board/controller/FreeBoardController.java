package com.koreate.betty.domain.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreate.betty.domain.board.service.FreeBoardService;
import com.koreate.betty.domain.board.vo.FreeBoard;
import com.koreate.betty.domain.member.service.MemberService;
import com.koreate.betty.domain.member.vo.Member;
import com.koreate.betty.global.util.PageMaker;
import com.koreate.betty.global.util.SearchCriteria;
import com.koreate.betty.global.util.SearchPageMaker;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/boards/free")
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;
	@Autowired
	MemberService memberService;
	
	@GetMapping
	public String freeBoardList(SearchCriteria cri, Model model) {
		List<FreeBoard> list = freeBoardService.freeList(cri);
		PageMaker pm = freeBoardService.getPageMaker(cri);
		log.info("cri page = {}",cri.getPage());
		model.addAttribute("list",list);
		model.addAttribute("pm",pm);
		return "board/free/free-board";
	}
	
	@GetMapping("new")
	public String freeBoardNew() {
		return "board/free/free-new";
	}
	
	@GetMapping("{bno}/edit")
	public String freeBoardEdit() {
		return "board/free/free-edit";
	}
	@GetMapping("{bno}")
	public String freeBoardDetail(@PathVariable Integer bno, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		FreeBoard board =  freeBoardService.detail(bno);
		model.addAttribute("board", board);
		log.info("cri = {}", cri);
		log.info("prev cri page = {}",cri.getPage());
		PageMaker pm = new SearchPageMaker();
		pm.setCri(cri);
		model.addAttribute("pm",pm);
		Member member = memberService.findOne(board.getMemberId());
		String img = member.getImg();
		model.addAttribute("img",img);
		log.info("post cri page = {}",cri.getPage());
		return "board/free/free-detail";
	}
	
}
