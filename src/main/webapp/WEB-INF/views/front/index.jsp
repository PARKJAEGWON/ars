<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ARS LEATHER</title>
    <!-- <%-- 톰캣 내부에서 서버xml이랑 컨테스트xml에서 ${pageContext.request.contextPath} 확인가능 이녀석이 환경에 맞춰 경로를 유동적으로 찾아줌 --%> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/styles.css">
    <!-- Swiper CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/front/common/header.jsp" />

    <main>
        <section class="hero-section">
            <div class="swiper hero-swiper">
                <div class="swiper-wrapper">
                    <!-- <div class="swiper-slide">
                        <div class="hero-content">
                            <h1>New Collection</h1>
                            <p>Discover the latest trends</p>
                            <a href="#" class="cta-button">자세히 보기</a>
                        </div>
                    </div> -->
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide1.jpg" alt="슬라이드1">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide2.jpg" alt="슬라이드2">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide3.jpg" alt="슬라이드3">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide4.jpg" alt="슬라이드4">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide5.jpg" alt="슬라이드5">
                    </div>
                </div>
                <!-- 페이지네이션(점) -->
                <div class="swiper-pagination"></div>
            </div>
        </section>

        <section class="featured-products">
            <h2>SEASON</h2>
            <div class="swiper recommended-swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="product" items="${seasonalProducts}">
                        <div class="swiper-slide">
                            <a href="${pageContext.request.contextPath}/productPost/detail?id=${product.id}" class="product-card">
                                <img src="${pageContext.request.contextPath}${product.mainImageUrl}" alt="${product.productName}" class="product-image">
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <!-- 네비게이션 버튼 -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </section>

        <section class="hero-section">
            <div class="swiper hero-swiper">
                <div class="swiper-wrapper">
                    <!-- <div class="swiper-slide">
                        <div class="hero-content">
                            <h1>New Collection</h1>
                            <p>Discover the latest trends</p>
                            <a href="#" class="cta-button">자세히 보기</a>
                        </div>
                    </div> -->
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide1.jpg" alt="슬라이드1">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide2.jpg" alt="슬라이드2">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide3.jpg" alt="슬라이드3">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide4.jpg" alt="슬라이드4">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide5.jpg" alt="슬라이드5">
                    </div>
                </div>
                <!-- 페이지네이션(점) -->
                <div class="swiper-pagination"></div>
            </div>
        </section>
        <section class="featured-products">
            <h2>MEN</h2>
            <div class="swiper recommended-swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="product" items="${menProducts}">
                        <div class="swiper-slide">
                            <a href="${pageContext.request.contextPath}/productPost/detail?id=${product.id}" class="product-card">
                                <img src="${pageContext.request.contextPath}${product.mainImageUrl}" alt="${product.productName}" class="product-image">
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <!-- 네비게이션 버튼 -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </section>
        <section class="hero-section">
            <div class="swiper hero-swiper">
                <div class="swiper-wrapper">
                    <!-- <div class="swiper-slide">
                        <div class="hero-content">
                            <h1>New Collection</h1>
                            <p>Discover the latest trends</p>
                            <a href="#" class="cta-button">자세히 보기</a>
                        </div>
                    </div> -->
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide1.jpg" alt="슬라이드1">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide2.jpg" alt="슬라이드2">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide3.jpg" alt="슬라이드3">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide4.jpg" alt="슬라이드4">
                    </div>
                    <div class="swiper-slide">
                        <img src="${pageContext.request.contextPath}/static/img/slide5.jpg" alt="슬라이드5">
                    </div>
                </div>
                <!-- 페이지네이션(점) -->
                <div class="swiper-pagination"></div>
            </div>
        </section>

        <section class="featured-products">
            <h2>WOMEN</h2>
            <div class="swiper recommended-swiper">
                <div class="swiper-wrapper">
                    <c:forEach var="product" items="${womenProducts}">
                        <div class="swiper-slide">
                            <a href="${pageContext.request.contextPath}/productPost/detail?id=${product.id}" class="product-card">
                                <img src="${pageContext.request.contextPath}${product.mainImageUrl}" alt="${product.productName}" class="product-image">
                            </a>
                        </div>
                    </c:forEach>
                </div>
                <!-- 네비게이션 버튼 -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/views/front/common/footer.jsp" />
    <script src="${pageContext.request.contextPath}/static/js/main.js"></script>
    <!-- Swiper JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</body>
</html> 