package com.example.spring01.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring01.emp.model.EmpVO;
import com.example.spring01.emp.repository.IEmpMapper;

@Service
public class EmpService implements IEmpservice {

	@Autowired
	private IEmpMapper mapper;
	
	@Override
	public void insert(EmpVO emp) {
		mapper.insert(emp);
	}

	@Override
	public List<EmpVO> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public void update(EmpVO emp) {
		mapper.update(emp);
	}

	@Override
	public void delete(String emp_no) {
		mapper.delete(emp_no);
	}

	
}
