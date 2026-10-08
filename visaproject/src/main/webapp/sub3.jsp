<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.EmployeeDao" %>
<%@ page import="model.EmployeeDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%
    // 통계 출력을 위해 DAO 데이터를 미리 조회합니다.
    EmployeeDao dao = new EmployeeDao();
    List<EmployeeDto> list = dao.selectAll();
    
    int totalEmployees = 0;
    int visaWarningCount = 0;
    long now = new Date().getTime();
    
    if (list != null) {
        totalEmployees = list.size();
        for (EmployeeDto dto : list) {
            if (dto.getExpiry_date() != null) {
                long expiry = dto.getExpiry_date().getTime();
                long diffDays = (expiry - now) / (1000 * 60 * 60 * 24);
                // 만료되었거나 30일 이내로 남은 직원 카운트
                if (diffDays <= 30) {
                    visaWarningCount++;
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외국인 직원 재류 관리 시스템</title>
<style>
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f5f6fa; margin: 0; padding: 0; }
    
    /* 상단 내비게이션 바 스태일링 */
    .navbar { background-color: #2c3e50; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
    .navbar-brand { color: white; font-size: 20px; font-weight: bold; text-decoration: none; }
    .navbar-menu { display: flex; gap: 20px; }
    .navbar-menu a { color: #ebd4d4; text-decoration: none; font-size: 15px; font-weight: bold; padding: 8px 16px; border-radius: 4px; transition: 0.3s; }
    .navbar-menu a:hover, .navbar-menu a.active { background-color: #34495e; color: white; }
    
    .container { max-width: 1000px; margin: 40px auto; padding: 0 20px; }
    .welcome-box { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); text-align: center; margin-bottom: 30px; }
    .welcome-box h1 { color: #2c3e50; margin-top: 0; }
    .welcome-box p { color: #7f8c8d; font-size: 16px; }
    
    /* 대시보드 카드 스타일링 */
    .dashboard-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 30px; }
    .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); border-left: 5px solid #3498db; }
    .card.warning { border-left-color: #e74c3c; }
    .card-title { font-size: 14px; color: #7f8c8d; text-transform: uppercase; font-weight: bold; }
    .card-value { font-size: 32px; font-weight: bold; color: #2c3e50; margin-top: 10px; }
    
    /* 바로가기 링크 가이드 */
    .quick-links { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
    .link-box { background: #34495e; color: white; padding: 25px; border-radius: 8px; text-align: center; text-decoration: none; font-size: 18px; font-weight: bold; transition: 0.3s; }
    .link-box:hover { background: #2c3e50; transform: translateY(-3px); }
    .link-box.register { background: #27ae60; }
    .link-box.register:hover { background: #219653; }
</style>
</head>
<body>

<!-- 공통 상단 내비게이션 바 -->
<div class="navbar">
    <a href="sub3.jsp" class="navbar-brand">🌐 외국인 직원 재류 관리 시스템</a>
    <div class="navbar-menu">
        <a href="sub3.jsp" class="active">홈으로</a>
        <a href="sub1.jsp">직원 목록 조회</a>
        <a href="sub2.jsp">신규 직원 등록</a>
    </div>
</div>

<div class="container">
    <div class="welcome-box">
        <h1>안녕하세요, 관리자님 👋</h1>
        <p>외국인 근로자의 인적 사항 등록 및 체류 기간(비자) 만료일을 통합 관리하는 홈 화면입니다.</p>
    </div>
    
    <!-- 실시간 요약 대시보드 구역 -->
    <div class="dashboard-grid">
        <div class="card">
            <div class="card-title">총 등록 직원 수</div>
            <div class="card-value"><%= totalEmployees %> 명</div>
        </div>
        <div class="card warning">
            <div class="card-title">비자 만료 임박자 (30일 이내)</div>
            <div class="card-value"><%= visaWarningCount %> 명</div>
        </div>
    </div>
    
    <!-- 메뉴판 바로가기 버튼 단락 -->
    <div class="quick-links">
        <a href="sub1.jsp" class="link-box">📋 전체 직원 목록 & 재류 현황 보러가기</a>
        <a href="sub2.jsp" class="link-box register">👤 신규 외국인 근로자 정보 등록하기</a>
    </div>
</div>

</body>
</html>