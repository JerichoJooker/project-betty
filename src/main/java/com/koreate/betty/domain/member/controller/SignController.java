package com.koreate.betty.domain.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreate.betty.domain.member.dto.LoginForm;
import com.koreate.betty.domain.member.service.MemberService;
import com.koreate.betty.domain.member.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/sign")
@RequiredArgsConstructor
public class SignController {	
	
	private final MemberService ms;
	
	@GetMapping("inin")
	public String login() {
		
		
		return "sign/sign-in";
	}
		
	@GetMapping("up")
	public String signUpChoose() {
		return "sign/sign-up-choose";
	}
	
	@GetMapping("up/member")
	public String signUP() {
		return "sign/sign-up-member";
	}
	
	@GetMapping("up/staff")
	public String signUp_staff() {
		return "sign/sign-up-staff";
	}
	

	@GetMapping("in")
	public String login(LoginForm form, HttpSession session) {
		Member loginMember = ms.loginMember(form);
		session.setAttribute("loginMember", loginMember);
		return "redirect:/";
	}

	
	
	
	
}