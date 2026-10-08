<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.EmployeeDao" %>
<%@ page import="model.VisaDao" %>
<%@ page import="model.EmployeeDto" %>
<%
    
    request.setCharacterEncoding("UTF-8");

    
    String empId = request.getParameter("emp_id");
    String name = request.getParameter("name");
    String nationality = request.getParameter("nationality");
    String passportNum = request.getParameter("passport_num");
    String residenceNum = request.getParameter("residence_num");
    String visaType = request.getParameter("visa_type");
    
    
    String hireDateStr = request.getParameter("hire_date");
    String issueDateStr = request.getParameter("issue_date");
    String expiryDateStr = request.getParameter("expiry_date");
    
    
    java.sql.Date hireDate = null;
    java.sql.Date issueDate = null;
    java.sql.Date expiryDate = null;
    
    try {
        if (hireDateStr != null && !hireDateStr.trim().isEmpty()) {
            hireDate = java.sql.Date.valueOf(hireDateStr);
        } else {
            hireDate = new java.sql.Date(System.currentTimeMillis()); 
        }
        
        if (issueDateStr != null && !issueDateStr.trim().isEmpty()) {
            issueDate = java.sql.Date.valueOf(issueDateStr);
        } else {
            issueDate = new java.sql.Date(System.currentTimeMillis());
        }
        
        if (expiryDateStr != null && !expiryDateStr.trim().isEmpty()) {
            expiryDate = java.sql.Date.valueOf(expiryDateStr);
        } else {
            expiryDate = new java.sql.Date(System.currentTimeMillis());
        }
    } catch (IllegalArgumentException e) {
        
        out.print("<script>alert('날짜 입력 형식이 잘못되었습니다. 다시 지정해 주세요.'); history.back();</script>");
        return;
    }

    
    EmployeeDto dto = new EmployeeDto();
    dto.setEmp_id(empId);
    dto.setName(name);
    dto.setNationality(nationality);
    dto.setPassport_num(passportNum);
    dto.setResidence_num(residenceNum);
    dto.setHire_date(hireDate);
    dto.setStatus("재직"); 
    
    dto.setVisa_type(visaType);
    dto.setIssue_date(issueDate);
    dto.setExpiry_date(expiryDate);

    
    EmployeeDao empDao = new EmployeeDao();
    VisaDao visaDao = new VisaDao();
    
    try {
        
        empDao.insert(dto);
        
        
        visaDao.insertVisa(empId, visaType, issueDate, expiryDate);
        
       
        response.sendRedirect("sub1.jsp");
        
    } catch(Exception e) {
        e.printStackTrace();
        out.print("<script>alert('DB 데이터 저장 중 예외가 발생했습니다.'); history.back();</script>");
    }
%>