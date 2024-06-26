<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>PlayGround - 마이페이지 - 나의 정보수정</title>
    <link rel="shortcut icon" href="/team1/images/favicon.png" type="image/png">
	<!-- 부트스트랩5 css/js -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/team1/css/common.css">
	<link rel="stylesheet" href="/team1/css/loginStyle.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- jQuery Validation  -->
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
  </head>
  <body>
  	<div class="user-confirm-box">
  		<div class="user-confirm">
  			<h2>회원 비밀번호 확인</h2>
  			<p>비밀번호를 입력해야 회원정보를 수정할 수 있습니다.</p>
  			<div class="form-group">
  				<input type="password" class="form-control" id="user-confirm-pass" />
  				<button type="button" class="btn btn-dark" id="user-confirm-btn">확인</button>
  			</div>
  			<a href="#close" class="close_btn"><img src="<c:url value="/images/close_icon.svg" />" alt="닫기아이콘" width="30"></a>
  		</div>
  	</div>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="main-wrap">
		<div class="inner-wrap">
			<jsp:include page="/WEB-INF/views/mypage/aside.jsp" />
			<div class="main-contents">
				<!-- 내용채우기 -->
				<div class="h2_title_wrap"><!-- 타이틀영역 -->
	        		<h2>마이페이지 - 나의 정보수정</h2>
	        	</div>
	        	<div class="login-form">
	        		<p>** 아이디는 수정이 불가능하여 입력이 안됩니다.</p>
	        		<form action="<c:url value="/mypage/signupdate" />" method="post" id="signupForm">
		              <div class="form-group">
		                <label for="id">아이디:</label>
		                <input type="text" class="form-control" id="id" name="id" value="${user.user_id }" readonly="readonly" />       
		              </div>
		              <div class="form-group">
		                <label for="email">이메일:</label>
		                <input type="email" class="form-control" id="email" name="email" value="${user.user_email }" required />
		              </div>
		              <div class="form-group">
		                <label for="pw">비밀번호:</label>
		                <input type="password" class="form-control" id="pw" name="pw" required />
		              </div>
		              <div class="form-group">
		                <label for="confirmPassword">비밀번호 확인:</label>
		                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required />
		              </div>
		              <div class="form-group">
		                <label for="nickname">닉네임:</label>
		                <input type="text" class="form-control" id="nickname" name="nickname" value="${user.user_nickname }" required />
		              </div>
		              <div class="form-group">
		                <label for="birth">생일:</label>
		                <input type="date" class="form-control" id="birth" name="birth" value="${dateToStr }" required />
		              </div>
		
		              <div class="form-actions">
		                <button type="submit" class="btn btn-dark">회원정보수정하기</button>
		              </div>
		            </form>
	        	</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<!-- 정규식 -->
	<script type="text/javascript">
		$(document).ready(function () { 
	        $("#signupForm").validate({ // form id 확인 
	          rules: {
	            email: {
	              required: true,
	              email: true,
	            },
	            pw: {
	              required: true,
	              regex: /^[a-zA-Z0-9!@#]{6,15}$/,
	            },
	            confirmPassword: {
	              equalTo: "#pw",
	              required: true
	            },
	            nickname: {
	              required: true,
	              regex: /^[a-zA-Z0-9가-힣_]{2,10}$/,
	            },
	            birth: {
	              //오늘 날짜 이후 선택 불가
	              max: new Date().toISOString().split("T")[0],
	              required: true,
	            },
	          },
	          messages: {
	            email: {
	              required: "필수 항목입니다.",
	              email: "올바른 이메일 주소를 입력해주세요.",
	            },
	            pw: {
	              required: "필수 항목입니다.",
	              regex:
	                "비밀번호는 6~15자의 영문 대소문자, 숫자, 특수문자(!@#)로만 구성해야 합니다.",
	            },
	            confirmPassword: {
	              equalTo: "입력하신 비밀번호와 일치해야 합니다.",
	              required: "필수 항목입니다.",
	            },
	            nickname: {
	              required: "필수 항목입니다.",
	              regex:
	                "닉네임은 2~10자의 영문 대소문자, 숫자, 한글, 밑줄(_)로만 구성해야 합니다.",
	            },
	            birth: {
	              max: "오늘 날짜 이전으로 선택해주세요.",
	              required: "필수 항목입니다.",
	            },
	          },
	        });
	
	        $.validator.addMethod(
	          "regex",
	          function (value, element, regexp) {
	            var re = new RegExp(regexp);
	            return this.optional(element) || re.test(value);
	          },
	          "정규표현식에 맞지 않습니다."
	        );
		});
		
		
		if(${passConfirm} == 1){
			$('.user-confirm-box').hide();
		}
		
		
		//user 비번 맞는지 확인 후 검정박스 없애기
		$('#user-confirm-btn').click(function(){
			let user_pw = '${user.user_pw}';
			
			let form_pw = $('#user-confirm-pass').val();
			
			if(form_pw == ''){
				alert('비밀번호를 입력해주세요.');
			}else{
				if(user_pw == form_pw){
					alert('맞는 비번입니다. 회원정보를 수정하세요.');
					$('.user-confirm-box').hide();
					<% session.setAttribute("passConfirm", "1"); %>
				}else{
					alert('비밀번호가 틀립니다. 다시 입력해주세요.');
					let q = confirm('계속하시겠습니까?');
					if(!q){
						location.href = <c:url value="/" />;
					}
					<% session.setAttribute("passConfirm", "0"); %>
				}
			}
		});
		
		//닫기 아이콘 클릭
		$('.close_btn').click(function(){
			let q = confirm("현재 창을 닫으시겠습니다. 닫으면 메인페이지로 이동합니다.");
			if(q){
				location.href = <c:url value="/" />;
			}
		});
	</script>
  </body>
</html>