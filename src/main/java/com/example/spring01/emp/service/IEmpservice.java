package com.example.spring01.emp.service;

import java.util.List;

import com.example.spring01.emp.model.EmpVO;

public interface IEmpservice {

	//직원 등록
		void insert(EmpVO emp);
		
		//직원 출력
		List<EmpVO> selectAll();
		
		//특정 직원 출력
		//EmpVO selectOne(String part);
		
		//직원 정보 수정
		void update(EmpVO emp);
		
		//직원 정보 삭제
		void delete(String emp_no);
		
}
