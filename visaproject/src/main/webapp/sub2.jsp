<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외국인 직원 등록</title>
<style>
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f5f6fa; margin: 0; padding: 20px; }
    .form-container { max-width: 600px; margin: 30px auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
    h2 { text-align: center; color: #2c3e50; margin-bottom: 25px; border-bottom: 2px solid #34495e; padding-bottom: 10px; }
    
    .section-title { font-size: 16px; font-weight: bold; color: #34495e; margin-top: 20px; margin-bottom: 10px; border-left: 4px solid #4CAF50; padding-left: 8px; }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 5px; color: #333; font-weight: bold; font-size: 14px; }
    .form-group input, .form-group select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; font-size: 14px; }
    
    .btn-submit { width: 100%; padding: 12px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; font-size: 16px; font-weight: bold; cursor: pointer; margin-top: 20px; }
    .btn-submit:hover { background-color: #45a049; }
</style>
</head>
<body>

<div class="form-container">
    <h2>👤 신규 외국인 직원 등록 </h2>
    
    <!-- 값을 입력한 뒤 sub2_process.jsp로 전송합니다 -->
    <form action="sub2_process.jsp" method="post">
        
        <div class="section-title">기본 인적 사항</div>
        
        <div class="form-group">
            <label for="emp_id">사원 번호 (Emp ID)</label>
            <input type="text" id="emp_id" name="emp_id" placeholder="예: E001" required>
        </div>
        
        <div class="form-group">
            <label for="name">이름 (Name)</label>
            <input type="text" id="name" name="name" placeholder="영문 또는 국문 이름 입력" required>
        </div>
        
        <div class="form-group">
            <label for="nationality">국적 (Nationality)</label>
            <input type="text" id="nationality" name="nationality" placeholder="예: 베트남, 우즈베키스탄" required>
        </div>
        
        <div class="form-group">
            <label for="passport_num">여권 번호 (Passport Number)</label>
            <input type="text" id="passport_num" name="passport_num" placeholder="여권 번호 입력" required>
        </div>
        
        <div class="form-group">
            <label for="residence_num">외국인 등록번호 (Residence Number)</label>
            <input type="text" id="residence_num" name="residence_num" placeholder="000000-0000000" required>
        </div>
        
        <div class="form-group">
            <label for="hire_date">입사일 (Hire Date)</label>
            <input type="date" id="hire_date" name="hire_date" required>
        </div>
        
        <div class="section-title">재류 자격 (비자) 정보</div>
        
        <div class="form-group">
            <label for="visa_type">비자 종류 (Visa Type)</label>
            <select id="visa_type" name="visa_type" required>
                <option value="">-- 선택하세요 --</option>
                <option value="E-7">E-7 (특정활동)</option>
                <option value="E-9">E-9 (비전문취업)</option>
                <option value="D-2">D-2 (유학)</option>
                <option value="F-2">F-2 (거주)</option>
                <option value="F-5">F-5 (영주)</option>
                <option value="H-2">H-2 (방문취업)</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="issue_date">비자 발급일 (Issue Date)</label>
            <input type="date" id="issue_date" name="issue_date" required>
        </div>
        
        <div class="form-group">
            <label for="expiry_date">비자 만료일 (Expiry Date)</label>
            <input type="date" id="expiry_date" name="expiry_date" required>
        </div>
        
        <button type="submit" class="btn-submit">💾 직원 정보 저장하기</button>
    </form>
</div>

</body>
</html>