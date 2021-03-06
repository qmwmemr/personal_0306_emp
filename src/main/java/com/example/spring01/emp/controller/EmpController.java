package com.example.spring01.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring01.emp.model.EmpVO;
import com.example.spring01.emp.service.IEmpservice;

@Controller
@RequestMapping("/emp")
public class EmpController {

	@Autowired
	private IEmpservice service;
	
	
	
	@GetMapping("/insert")
	public void insert() {
		System.out.println("/emp/insert get");
	}
	
	@PostMapping("/insert")
	public String insert(EmpVO emp, Model model) {
		System.out.println("/emp/insert post");
		
		service.insert(emp);
		return "redirect:/emp/list";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		System.out.println("/emp/list get");
		List<EmpVO> list = service.selectAll();
		
		model.addAttribute("article",list);
		
		return "/emp/list";
	}
	
	
	//직원번호 중복 체크
	@PostMapping("/noCheck")
	public Integer noCheck(@RequestBody String emp_no) {
		System.out.println("/emp/noCheck post");
		System.out.println("parameter: " + emp_no);
		
		Integer cnt = service.noCheck(emp_no);
		
		System.out.println(cnt);
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
}
