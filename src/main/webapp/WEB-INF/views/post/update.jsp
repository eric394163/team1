<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PlayGround - 게시글 수정</title>
	<link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/boardStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="main-wrap">
			<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/common/aside.jsp" />
			<div class="main-contents">
				<div class="h2_title_wrap">
					<h2>게시글 수정</h2> 
					<a href="<c:url value="/post/list" />" class="btn btn-outline-dark">목록으로</a>
				</div>
				<form action="<c:url value="/post/update"/>" method = "post" enctype ="multipart/form-data">
					<div class="form-row">
						<input type="hidden" name="num" value="${post.post_id }">
					    <label for="board" class="form-label">게시판 선택</label>
					    <select class="form-control second-box" id="board" name="board">
					    	<c:forEach items="${list}" var="board">
								<option value="${board.board_id}"  <c:if test="${post.post_board_num == board.board_id}">selected</c:if>>${board.board_name}</option>
					    	</c:forEach>
					    </select>
					    <span class="icon">▼</span>
					</div>
					<div class="form-row">
					    <label for="title" class="form-label">제목</label>
					    <input type="text" class="form-control second-box" id="title" placeholder="제목을 입력하세요" name="title" value="${post.post_title}">
					 </div>
					 <div class="form-row content">
					    <label for="content" class="form-label">내용</label>
					    <textarea rows="10" class="form-control second-box" id="content" placeholder="내용을 입력하세요" name="content" >${post.post_content}</textarea>
					 </div>
					<div class="form-row content box-attachment">
					    <label for="file" class="form-label" id="attachment">첨부파일</label>
					    <div class="file-link-all">
						    <c:forEach items="${fileList}" var="file">
						    	<c:if test="${file.attach_link_check == 0}">
						    		<div class="form-control">
							    		 <span>${file.attach_path}</span>
					 					 <a href="#" id="btnDel" class="btn-del" data-target="${file.attach_num}">
					 					 	<img src="<c:url value="/images/trash_icon.svg" />" alt="휴지통아이콘" width="16">
					 					 </a>
						    		</div>
						 		 </c:if>
						    </c:forEach>
						    <div class="file-box">
							    <c:forEach begin="1" end="${3 - fileList.size()}">
									<input type="file" name="file" class="form-control second-box file"">
								</c:forEach>
							</div>
						</div>
					 </div>
					 <div class="form-row">
					    <label for="link" class="form-label">링크</label>
			    		<c:if test="${link.attach_link_check != 0}">
						    <input type="text" class="form-control second-box" name="link" value="${link.attach_path }">
			    		</c:if>
					 </div>	
					 <div class="form-row last">
					 	<button class="btn btn-dark">게시글 수정</button>
					 </div>				 
				</form>				
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		$(".btn-del").click(function() {
			
			let attach_num = $(this).data("target");
			
			let inputFile = '<input type="file" class="form-control" name="file">';
			$("#attachment").append(inputFile);
			
			let inputHidden = `<input type="hidden" name="attach_num" value="\${attach_num}">`;
			$("#attachment").prepend(inputHidden);
			
			$(this).parent().remove();
		});
		
		$('#content').summernote({
		  placeholder: '내용을 입력하세요.',
		  tabsize: 2,
		  height: 400
		});
	</script>
</body>
</html>