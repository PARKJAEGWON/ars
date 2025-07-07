<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Collection - Luxury Fashion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/product.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/front/common/header.jsp" />

    <main>
        <section class="collection-header">
            <h1 class="collection-title">Collection</h1>
            <p class="collection-description">럭셔리한 가죽 제품들의 컬렉션을 만나보세요.</p>
        </section>

    <!-- <div class="filter-section">
            <div class="filter-group">
                <select class="filter-select" onchange="filterProducts('category', this.value)">
                    <option value="">카테고리</option>
                    <option value="0">서류가방</option>
                    <option value="1">백팩</option>
                    <option value="2">핸드백</option>
                </select>
                <select class="filter-select" onchange="filterProducts('price', this.value)">
                    <option value="">가격</option>
                    <option value="low">낮은 가격순</option>
                    <option value="high">높은 가격순</option>
                </select>
            </div>
            <div class="filter-group">
                <select class="filter-select" onchange="filterProducts('sort', this.value)">
                    <option value="newest">최신순</option>
                    <option value="popular">인기순</option>
                </select>
            </div> 
        </div>-->

        <div class="product-grid">
            <c:forEach var="product" items="${productPage.content}">
                <a href="${pageContext.request.contextPath}/productPost/detail?id=${product.id}" class="product-card">
                    <div class="product-category">
                        <c:choose>
                            <c:when test="${product.productCategory == 0}">서류가방</c:when>
                            <c:when test="${product.productCategory == 1}">백팩</c:when>
                            <c:when test="${product.productCategory == 2}">핸드백</c:when>
                            <c:otherwise>기타</c:otherwise>
                        </c:choose>
                    </div>
                    <img src="${pageContext.request.contextPath}${product.mainImageUrl}" alt="${product.productName}" class="product-image">
                    <div class="product-info">
                        <h3 class="product-name">${product.productName}</h3>
                        <div class="product-price"><fmt:formatNumber value="${product.productPrice}" type="number" />원</div>
                    </div>
                </a>
            </c:forEach>
        </div>

        <div class="pagination">
            <c:if test="${totalPages > 0}">
                <c:if test="${currentPage > 0}">
                    <a href="?page=${currentPage-1}">&lt;</a>
                </c:if>
                
                <c:forEach begin="0" end="${totalPages-1}" var="i">
                    <a href="?page=${i}" class="${currentPage == i ? 'active' : ''}">${i+1}</a>
                </c:forEach>
                
                <c:if test="${currentPage < totalPages-1}">
                    <a href="?page=${currentPage+1}">&gt;</a>
                </c:if>
            </c:if>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/front/common/footer.jsp" />

    <script>
        function filterProducts(type, value) {
            const currentUrl = new URL(window.location.href);
            currentUrl.searchParams.set(type, value);
            window.location.href = currentUrl.toString();
        }
    </script>
</body>
</html> 