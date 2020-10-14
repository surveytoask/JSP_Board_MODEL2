<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="com.kb.www.common.loginmanager.LoginManager"%>
<%
	LoginManager lm = LoginManager.getInstance();
String id = lm.getMemberId(session);
%>
<html>
<meta charset="UTF-8">
<head>
<title>로그인</title>
<script>
	function validateCheck() {
		var id = $('#id').val();
		var pw = $('#pw').val();
		if (!id) {
			alert("아이디를 입력해주세요.");
			$('#id').focus();
			return false;
		}
		if (!pw) {
			alert("비밀번호를 입력해주세요.");
			$('#pw').focus();
			return false;
		}
	}
</script>
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/customs.css">
<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/index.jsp">kobalja의 게시판</a>
		</div>

		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/index.jsp">메인</a></li>
				<!-- <--- 현재 접속 페이지가 메인이란 걸 알려줌 -->
				<li><a href="/list.do">게시판</a></li>
				<li><a href="/index.jsp">공지사항</a></li>
				<li><a href="/list.do">1:1 문의</a></li>
			</ul>
			<%
				if (id == null) {
			%>
			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li class="active"><a href="/login.do">로그인</a></li>
						<li><a href="/join.do">회원가입</a></li>

					</ul></li>
			</ul>
			<%
				}
			if (id != null) {
			%>
			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=id%>님<span class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="/logout.do">로그아웃</a></li>
						<li><a href="/memberinfo.do">회원정보수정</a></li>
						<%
							}
						if (id != null && id.equals("admin")) {
						%>
						<li><a href="/history.do">회원히스토리</a></li>
						<%
							}
						%>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<!-- 점보트론 -->

			<div class="jumbotron" style="padding-top: 20px;">

				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="/loginProc.do"
					onsubmit="return validateCheck()">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="id" id="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" id="pw" class="form-control"
							placeholder="비밀번호" name="pw" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</form>
			</div>
		</div>
	</div>
</body>
</html>