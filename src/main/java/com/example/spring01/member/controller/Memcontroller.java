package com.example.spring01.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring01.member.model.MemVO;
import com.example.spring01.member.service.IMemService;

@Controller
@RequestMapping("/member")
public class Memcontroller {

	@Autowired
	private IMemService service;
	
	@GetMapping("/memberJoin")
	public String insert() {
		
		System.out.println("/memberjoin get");
		
		return "/member/memberJoin";
		
	}
	
	@PostMapping("/memberjoinpro.do")
	public String insert(MemVO vo) {
		System.out.println("/memberjoin post");
		
		service.memberJonMethod(vo);
		System.out.println("회원정보 전송완료");
		
		
		return "/member/main";
		
	}
	
	
	
	
}
