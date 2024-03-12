<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post list</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/team1/css/common.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp" />
			<div class="main-contents">
				<h2>게시글 리스트</h2>
				<a class="nav-link" href="<c:url value="/post/insert"/>">게시글 쓰기</a>
				<hr>
				<form action="<c:url value="/post/list"/>" >
					<div class="input-group">
						<!-- 검색  -->
						<%-- <select name="type" class="form-control">
							<option value="all" <c:if test='${pm.cri.type == "all" }'>selected</c:if>>전체</option>
							<option value="title" <c:if test='${pm.cri.type == "title" }'>selected</c:if>>제목</option>	
							<option value="writer" <c:if test='${pm.cri.type == "writer" }'>selected</c:if>>작성자</option>
						</select>
						<input type="text" class="form-control" placeholder="검색어를 입력하세요" name="search" value='${pm.cri.search}'>
						<button class="btn btn-outline-warning">검색</button> --%>
					</div>
				</form>
				
				<table class="table table hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>게시판 이름</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="post">
							<tr>
								<td>${post.post_id}</td>
								<td>${post.board.board_name}</td>
								<td>
									<c:url var="url" value="/post/detail">
										<c:param name="num" value="${post.post_id}"/>
									</c:url>
									<a href="${url}">${post.post_title}</a>
								</td>
								<td>${post.post_user_id }</td>
								<td>${post.post_view }</td>
							</tr>
						</c:forEach>
						<c:if test="${list.size() == 0 }">
							<tr>
								<th colspan="5">
									<h4 class="text-center">등록된 게시글이 없습니다.</h4>
								</th>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script type="text/javascript">
	
	</script>
</body>
</html>