package com.example.spring01.emp.model;

public class EmpVO {
	
	private int emp_pk;
	private String emp_no;
	private String emp_name;
	private String emp_number;
	private String emp_position;
	private String emp_email;
	
	
	public int getEmp_pk() {
		return emp_pk;
	}
	public void setEmp_pk(int emp_pk) {
		this.emp_pk = emp_pk;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_number() {
		return emp_number;
	}
	public void setEmp_number(String emp_number) {
		this.emp_number = emp_number;
	}
	public String getEmp_position() {
		return emp_position;
	}
	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	@Override
	public String toString() {
		return "EmpVO [emp_pk=" + emp_pk + ", emp_no=" + emp_no + ", emp_name=" + emp_name + ", emp_number="
				+ emp_number + ", emp_position=" + emp_position + ", emp_email=" + emp_email + "]";
	}
	
	
	
	

}
