package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

public class EmployeeDao {
	
	public void insert(EmployeeDto dto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    
	    String sql = "INSERT INTO Employee (emp_id, name, nationality, passport_num, residence_num, hire_date) "
	               + "VALUES (?, ?, ?, ?, ?, ?)";

	    try {
	        conn = DBM.getInstance();
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setString(1, dto.getEmp_id());
	        pstmt.setString(2, dto.getName());
	        pstmt.setString(3, dto.getNationality());
	        pstmt.setString(4, dto.getPassport_num());
	        pstmt.setString(5, dto.getResidence_num());
	        pstmt.setDate(6, dto.getHire_date()); 

	        pstmt.executeUpdate();
	        System.out.println("-> 직원 기본 정보 등록 완료!");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if(pstmt != null) pstmt.close(); } catch(Exception e){}
	    }
	}
	
	public List<EmployeeDto> selectAll() {
	    List<EmployeeDto> list = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	   
	    String sql = "SELECT e.emp_id, e.name, e.nationality, e.passport_num, e.status, v.visa_type, v.expiry_date "
	               + "FROM Employee e "
	               + "LEFT JOIN Visa v ON e.emp_id = v.emp_id";

	    try {
	        conn = DBM.getInstance(); 
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            EmployeeDto dto = new EmployeeDto();
	            dto.setEmp_id(rs.getString("emp_id"));
	            dto.setName(rs.getString("name"));
	            dto.setNationality(rs.getString("nationality"));
	            dto.setPassport_num(rs.getString("passport_num"));
	            dto.setStatus(rs.getString("status"));
	            
	            
	            dto.setVisa_type(rs.getString("visa_type"));
	            dto.setExpiry_date(rs.getDate("expiry_date"));

	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        
	        try { if(rs != null) rs.close(); } catch(Exception e){}
	        try { if(pstmt != null) pstmt.close(); } catch(Exception e){}
	    }
	    return list;
	}
	
	public void delete(String empId) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = "DELETE FROM Employee WHERE emp_id = ?";

	    try {
	        conn = DBM.getInstance();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, empId);
	        pstmt.executeUpdate();
	        System.out.println("-> 사번 " + empId + " 직원 정보 및 비자 자동 삭제 완료!");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { if(pstmt != null) pstmt.close(); } catch(Exception e){}
	    }
	}

}
