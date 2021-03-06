package com.example.spring01.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	

	
	
	
	
	
	
	
	
	
	
	
}
