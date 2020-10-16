<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="com.kb.www.common.loginmanager.LoginManager"%>
<%
	LoginManager lm = LoginManager.getInstance();
String id = lm.getMemberId(session);
%>
<html>
<meta charset="UTF-8">
<head>
<title>회원가입</title>
</head>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/customs.css">
<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>
<script src="js/joinForm.js"></script>
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
				<li><a href="/list.do?pn=1">게시판</a></li>
				<li><a href="/index.jsp">공지사항</a></li>
			</ul>
			<%
				if (id == null) {
			%>
			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="/login.do">로그인</a></li>
						<li class="active"><a href="/join.do">회원가입</a></li>

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
						<li><a href="/updateinfo.do">회원정보수정</a></li>
						<li onclick="confirm_leave()"><a>회원탈퇴</a></li>
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
	<div style="width: 750px;" class="container">
		<form action="/joinProc.do" method="post" id="joinForm">
			<h3 style="text-align: center;">회원가입</h3>
			<div class="form-group">
				<label for="id">아이디</label>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="아이디" name="id"
						id="id" maxlength="20" oninput="initCheckId()"> <span
						class="input-group-btn">
						<button type="button" class="btn btn-primary"
							style="font-family: 'Noto Sans KR', sans-serif;" id="dup"
							onclick="checkId()">중복확인</button>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" placeholder="비밀번호" name="pw" id="pw"
					maxlength="20">
			</div>
			<div class="form-group">
				<label for="pw_confirm">비밀번호 확인</label> <input type="password"
					class="form-control" placeholder="비밀번호확인" name="pw_confirm"
					id="pw_confirm" maxlength="20">
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" class="form-control"
					placeholder="이름" name="mb_name" id="mb_name" maxlength="20">
			</div>
			<div class="form-group" style="text-align: center;">
				<div class="btn-group" data-toggle="buttons">
					<label class="radio-inline btn btn-danger"> <input
						type="radio" id="man" name="mb_gender" value="남자"
						autocomplete="off" required>남자
					</label> <label class="radio-inline btn btn-success"> <input
						type="radio" id="woman" name="mb_gender" autocomplete="off"
						value="여자" required>여자
					</label> <br /> <input type="button" class="btn btn-primary"
						value="성별 확인하기" style="border-radius: 10px; margin-top: 10px;"
						onclick="checkGender()">
				</div>
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="email"
					class="form-control" placeholder="이메일" id="mb_email"
					name="mb_email" maxlength="100">
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-primary form-control"
					value="회원가입" onclick="validateCheck()">
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary form-control"
					onclick="location.href='/'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>
