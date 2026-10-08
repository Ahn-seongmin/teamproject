package model;

import java.sql.Date;

public class EmployeeDto {
	private String emp_id;
	private String name;
	private String nationality;
	private String passport_num;
	private String residence_num;
	private Date hire_date;
	private String status;
	private Date issue_date;
	
	public Date getIssue_date() {
		return issue_date;
	}
	public void setIssue_date(Date issue_date) {
		this.issue_date = issue_date;
	}
	private String visa_type;
	private Date expiry_date;
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getPassport_num() {
		return passport_num;
	}
	public void setPassport_num(String passport_num) {
		this.passport_num = passport_num;
	}
	public String getResidence_num() {
		return residence_num;
	}
	public void setResidence_num(String residence_num) {
		this.residence_num = residence_num;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getVisa_type() {
		return visa_type;
	}
	public void setVisa_type(String visa_type) {
		this.visa_type = visa_type;
	}
	public Date getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
	}
	
	

}
