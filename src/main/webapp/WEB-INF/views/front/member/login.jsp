<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/front/common/header.jsp" />

    <main>
        <div class="login-container">
            <div class="logo">KMW</div>
            <input type="hidden" id ="loginError" value="${loginError}">
            <input type="hidden" id="message" value="${message}">
            <input type="hidden" id="restoreError" value="${restoreError}">
            <input type="hidden" id="withdrawnAccount" value="${withdrawnAccount}">
            <input type="hidden" id="withdrawnLoginId" value="${withdrawnLoginId}">
            <input type="hidden" id="withdrawnPassword" value="${withdrawnPassword}">
            <form class="login-form" method="post" action="${pageContext.request.contextPath}/member/login">
                <div class="input-group">
                    <input type="text" name="memberLoginId" placeholder="아이디" required>
                </div>
                <div class="input-group">
                    <input type="password" name="memberPassword" placeholder="비밀번호" required>
                </div>
                <div class="options">
                    <!-- <label><input type="checkbox"> 자동 로그인</label> -->
                    <a href="#" class="find-link">아이디·비밀번호 찾기</a>
                </div>
                <button type="submit" class="login-btn">로그인</button>
            </form>
            <a href="${pageContext.request.contextPath}/member/signup" class="signup-btn">회원가입</a>
        </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/front/common/footer.jsp" />
    <script src="/static/js/login.js"></script>
</body>
</html>