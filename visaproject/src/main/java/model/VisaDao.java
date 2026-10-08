package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class VisaDao {
	
	 public void insertVisa(String empId, String visaType, java.sql.Date issueDate, java.sql.Date expiryDate) {
	       Connection conn = null;
	       PreparedStatement pstmt = null;
	        
	        
	        String sql = "INSERT INTO Visa (emp_id, visa_type, issue_date, expiry_date) "
	                   + "VALUES (?, ?, ?, ?)";

	        try {
	            conn = DBM.getInstance();
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, empId);
	            pstmt.setString(2, visaType);
	            pstmt.setDate(3, issueDate);
	            pstmt.setDate(4, expiryDate);
	            
	            pstmt.executeUpdate();
	            System.out.println("-> 비자 정보 등록 완료!");
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try { if(pstmt != null) pstmt.close(); } catch(Exception e){}
	        }
	    }

}
