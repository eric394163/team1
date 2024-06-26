<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="main-wrap">
      <div class="inner-wrap">
        <jsp:include page="/WEB-INF/views/common/aside.jsp" />
        <div class="main-contents">
          <!-- 메인페이지에서만 보이는 것 인클루드 -->
          <!-- 메인이미지슬라이더 -->
          <jsp:include page="/WEB-INF/views/main/mainSlider.jsp" />
          <!-- 인기게시글 -->
          <jsp:include page="/WEB-INF/views/main/popularPostList.jsp" />
          <!-- 전체게시글 리스트 -->
          <jsp:include page="/WEB-INF/views/main/totalPostList.jsp" />
        </div>
      </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>


    



 
