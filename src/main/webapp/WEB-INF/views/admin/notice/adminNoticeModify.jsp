<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="/static/css/admin.css">
    <link rel="stylesheet" href="/static/css/adminNotice.css">
    <!-- jQuery & Summernote CDN -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/layout.jsp" %>
<main>
    <div class="main-content">
        <h2>공지사항 수정</h2>
        <form action="${pageContext.request.contextPath}/admin/kmw/notice/update?id=${notice.id}" method="post" enctype="multipart/form-data" class="notice-create-form">
            <div class="notice-top-checkbox">
                <span>최상위 여부</span>
                <input type="checkbox" id="noticeTop" name="noticeTop" value="1" ${notice.noticeStatus == 1 ? 'checked' : ''}>
            </div>
            <div class="form-group title-group">
                <label for="noticeTitle">제목</label>
                <input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}" required>
                <input type="hidden" id="noticeStatus" name="noticeStatus" value="${notice.noticeStatus}">
            </div>
            <div class="form-group">
                <label for="noticeContent">내용</label>
                <textarea id="noticeContent" name="noticeContent" rows="10" required>${notice.noticeContent}</textarea>
            </div>
            <div class="button-group">
                <button type="submit" class="btn">수정</button>
                <a href="${pageContext.request.contextPath}/admin/kmw/notice/detail?id=${notice.id}" class="btn">취소</a>
            </div>
        </form>
    </div>
</main>
<script>
$(document).ready(function() {
    // Summernote 에디터 초기화
    $('#noticeContent').summernote({
        height: 500,
        lang: 'ko-KR',
        callbacks: {
            onImageUpload: function(files) {
                uploadImage(files[0], this);
            }
        }
    });

    // 최상위 체크박스 이벤트 처리
    $('#noticeTop').change(function() {
        if(this.checked) {
            $('#noticeStatus').val(1);
        } else {
            $('#noticeStatus').val(0);
        }
    });
});

// 이미지 업로드 함수
function uploadImage(file, editor) {
    const formData = new FormData();
    formData.append('file', file);
    
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/kmw/notice/uploadImage',
        method: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            $(editor).summernote('insertImage', response.url);
        }
    });
}
</script>
</body>
</html>