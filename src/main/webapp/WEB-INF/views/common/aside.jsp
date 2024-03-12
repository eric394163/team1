<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>aside</title>
    <link rel="stylesheet" href="/team1/css/common.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <aside>
      <div
        class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
        style="width: 280px"
      >
        <div class="login-box">
          <img alt="예시이미지" src="https://via.placeholder.com/80" /> <br />
          <p>
            로그인 후 더 편하게 <br />
            PLAY GROUND를 이용해 보세요
          </p>
          <ul>
            <li><a href="<c:url value="/login" />">로그인</a></li>
            <li><a href="<c:url value="/signup" />">회원가입</a></li>
          </ul>
        </div>
        <hr />
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="#" class="nav-link active" aria-current="page">
              공지 게시판
            </a>
          </li>
          <li><a href="#" class="nav-link text-white"> 전체 게시판 </a></li>
          <c:forEach items="${category}" var="category">
            <li class="drop-down">
              <a href="#" class="nav-link text-white clearfix">
                <span class="float-start">${category.category_name}</span>
                <span class="float-end">▽</span></a
              >
              <ul class="nav nav-pills flex-column mb-auto" id="main-sub-nav1">
                <c:forEach items="${board}" var="board">
                  <c:if
                    test="${category.category_id == board.board_category_num}"
                  >
                    <li style="padding-left: 35px">
                      <a href="#" class="nav-link text-white"
                        >${board.board_name}</a
                      >
                    </li>
                  </c:if>
                </c:forEach>
              </ul>
            </li>
          </c:forEach>
        </ul>
        <hr />
        <div class="manage-btn">
          <a class="nav-link" href="#">관리자 페이지</a>
        </div>
      </div>
    </aside>
    <script type="text/javascript">
      $(".drop-down .nav-link").click(function () {
        let is = $(this).next().is(":hidden");

        if (is) {
          $(".drop-down .nav-link").next().stop().slideUp("fast");
          $(".drop-down .nav-link")
            .children(".float-end")
            .removeClass("active");
          $(this).next().stop().slideDown("fast");
          $(this).children(".float-end").addClass("active");
        } else {
          $(this).next().stop().slideUp("fast");
          $(this).children(".float-end").removeClass("active");
        }
      });
    </script>
  </body>
</html>
