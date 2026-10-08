package model;
import java.util.List;
import java.util.Scanner;


public class EmployeeMain {
	
	public class Main {
	    public static void main(String[] args) {
	    	Scanner sc = new Scanner(System.in);
	        EmployeeDao empDao = new EmployeeDao();
	        VisaDao visaDao = new VisaDao();

	        System.out.println("====== [ 1. 신규 외국인 직원 정보 입력 ] ======");
	        
	        System.out.print("사원 번호: ");
	        String empId = sc.nextLine();
	        
	        System.out.print("이름: ");
	        String name = sc.nextLine();
	        
	        System.out.print("국적: ");
	        String nationality = sc.nextLine();
	        
	        System.out.print("여권 번호: ");
	        String passportNum = sc.nextLine();
	        
	        System.out.print("외국인 등록번호: ");
	        String residenceNum = sc.nextLine();
	        
	        System.out.print("입사일 (YYYY-MM-DD 형식으로 입력, 예: 2026-03-15): ");
	        String hireDateStr = sc.nextLine();
	        java.sql.Date hireDate = java.sql.Date.valueOf(hireDateStr);
	        
	        System.out.print("비자 종류 (예: E-7, D-2): ");
	        String visaType = sc.nextLine();
	        
	        System.out.print("비자 발급일 (YYYY-MM-DD 형식으로 입력): ");
	        String issueDateStr = sc.nextLine();
	        java.sql.Date issueDate = java.sql.Date.valueOf(issueDateStr);
	        
	        System.out.print("비자 만료일 (YYYY-MM-DD 형식으로 입력): ");
	        String expiryDateStr = sc.nextLine();
	        java.sql.Date expiryDate = java.sql.Date.valueOf(expiryDateStr);

	        
	        EmployeeDto dto = new EmployeeDto();
	        dto.setEmp_id(empId);
	        dto.setName(name);
	        dto.setNationality(nationality);
	        dto.setPassport_num(passportNum);
	        dto.setResidence_num(residenceNum);
	        dto.setHire_date(hireDate);
	        
	        System.out.println("\n데이터베이스에 순차 저장을 시작합니다...");

	        
	        visaDao.insertVisa(empId, visaType, issueDate, expiryDate); 
	        
	        System.out.println("====== 등록 완료 후 최신 목록 조회 ======\n");
	        List<EmployeeDto> employeeList = empDao.selectAll();
	        
	        for (EmployeeDto emp : employeeList) {
	            System.out.print("사번: " + emp.getEmp_id() + " | ");
	            System.out.print("이름: " + emp.getName() + " | ");
	            System.out.print("국적: " + emp.getNationality() + " | ");
	            System.out.print("상태: " + emp.getStatus() + " | ");
	            System.out.print("비자종류: " + (emp.getVisa_type() != null ? emp.getVisa_type() : "없음") + " | ");
	            System.out.println("만료일자: " + (emp.getExpiry_date() != null ? emp.getExpiry_date().toString() : "없음"));
	        }
	        
	        sc.close();
	    }
	}

}
