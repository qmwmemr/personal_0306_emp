package com.example.spring01.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring01.member.model.MemVO;
import com.example.spring01.member.repository.IMemMapper;

@Service
public class MemService implements IMemService {

	@Autowired
	private IMemMapper mapper;
	
	@Override
	public void memberJonMethod(MemVO vo) {
		mapper.memberJonMethod(vo);
	}

}
