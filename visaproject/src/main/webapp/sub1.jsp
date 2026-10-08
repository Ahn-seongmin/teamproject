<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.EmployeeDao" %>
<%@ page import="model.EmployeeDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외국인 직원 재류 관리 시스템 - 목록</title>
<style>
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f5f6fa; margin: 0; padding: 0; }
    
    /* 상단 내비게이션 바 스타일링 */
    .navbar { background-color: #2c3e50; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
    .navbar-brand { color: white; font-size: 20px; font-weight: bold; text-decoration: none; }
    .navbar-menu { display: flex; gap: 20px; }
    .navbar-menu a { color: #ebd4d4; text-decoration: none; font-size: 15px; font-weight: bold; padding: 8px 16px; border-radius: 4px; transition: 0.3s; }
    .navbar-menu a:hover { background-color: #34495e; color: white; }

    .container { max-width: 1200px; margin: 40px auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    h2 { text-align: center; color: #2c3e50; margin-bottom: 30px; }
    
    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    th, td { padding: 12px 15px; text-align: center; border-bottom: 1px solid #ddd; }
    th { background-color: #34495e; color: white; font-weight: bold; }
    tr:hover { background-color: #f1f2f6; }
    
    /* 비자 상태 스타일링 */
    .status-badge { padding: 5px 10px; border-radius: 20px; font-size: 12px; font-weight: bold; }
    .active { background-color: #e2fbe8; color: #1e7e34; }
    .leave { background-color: #fce8e6; color: #c82333; }
    
    /* 비자 만료 경고 스타일링 */
    .warning-danger { background-color: #ffcccc; color: #cc0000; font-weight: bold; animation: blink 1.5s infinite; }
    .warning-alert { background-color: #fff3cd; color: #856404; font-weight: bold; }
    
    @keyframes blink {
        0% { background-color: #ffcccc; }
        50% { background-color: #ffe6e6; }
        100% { background-color: #ffcccc; }
    }
</style>
</head>
<body>

<!-- 공통 상단 내비게이션 바 -->
<div class="navbar">
    <a href="sub3.jsp" class="navbar-brand">🌐 외국인 직원 재류 관리 시스템</a>
    <div class="navbar-menu">
        <a href="sub3.jsp">홈으로</a>
        <a href="sub1.jsp" style="background-color: #34495e; color: white;">직원 목록 조회</a>
        <a href="sub2.jsp">신규 직원 등록</a>
    </div>
</div>

<div class="container">
    <h2>📋 외국인 직원 및 재류 관리 목록 </h2>
    
    <table>
        <thead>
            <tr>
                <th>사번</th>
                <th>이름</th>
                <th>국적</th>
                <th>여권번호</th>
                <th>상태</th>
                <th>비자종류</th>
                <th>비자만료일</th>
                <th>관리 상태</th>
                <th>데이터 관리</th> 
            </tr>
        </thead>
        <tbody>
        <%
            
            EmployeeDao dao = new EmployeeDao();
            List<EmployeeDto> list = dao.selectAll();
            
            
            long now = new Date().getTime();
            
            if (list == null || list.isEmpty()) {
        %>
            <tr>
                <td colspan="9" style="color: #7f8c8d; padding: 30px;">등록된 외국인 직원 데이터가 없습니다.</td>
            </tr>
        <%
            } else {
                for (EmployeeDto emp : list) {
                    
                    String rowClass = "";
                    String memo = "정상";
                    
                    if (emp.getExpiry_date() != null) {
                        long expiry = emp.getExpiry_date().getTime();
                        long diffDays = (expiry - now) / (1000 * 60 * 60 * 24); // 남은 날짜 계산
                        
                        if (diffDays < 0) {
                            rowClass = "warning-danger";
                            memo = "🚨 기간 만료!";
                        } else if (diffDays <= 30) {
                            rowClass = "warning-alert";
                            memo = "⚠️ 30일 이내 만료 예정";
                        } else if (diffDays <= 90) {
                            memo = "90일 이내 만료 예정";
                        }
                    }
        %>
            <tr>
                <td><%= emp.getEmp_id() %></td>
                <td><strong><%= emp.getName() %></strong></td>
                <td><%= emp.getNationality() %></td>
                <td><%= emp.getPassport_num() %></td>
                <td>
                    <% if("재직".equals(emp.getStatus()) || emp.getStatus() == null) { %>
                        <span class="status-badge active">재직</span>
                    <% } else { %>
                        <span class="status-badge leave"><%= emp.getStatus() %></span>
                    <% } %>
                </td>
                <td><%= emp.getVisa_type() != null ? emp.getVisa_type() : "<span style='color:#bbb;'>미등록</span>" %></td>
                <td class="<%= rowClass %>">
                    <%= emp.getExpiry_date() != null ? emp.getExpiry_date().toString() : "<span style='color:#bbb;'>-</span>" %>
                </td>
                <td class="<%= rowClass %>" style="font-size: 13px;"><%= memo %></td>
                
                <!-- [삭제] 버튼 연동 구역  -->
                <td>
                    <a href="delete_process.jsp?emp_id=<%= emp.getEmp_id() %>" 
                       onclick="return confirm('이 직원의 정보와 비자 기록이 모두 삭제됩니다. 정말 삭제하시겠습니까?');" 
                       style="color: #e74c3c; font-weight: bold; text-decoration: none; border: 1px solid #e74c3c; padding: 5px 10px; border-radius: 4px; display: inline-block; font-size: 13px;">
                       삭제
                    </a>
                </td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>