<%@page import="com.kb.www.vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kb.www.common.loginmanager.LoginManager"%>
<%
	ArticleVO vo = (ArticleVO) request.getAttribute("article");
LoginManager lm = LoginManager.getInstance();
String id = lm.getMemberId(session);
String nowPage = request.getParameter("pn");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일상 게시판</title>
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>
<script src="js/custom.js"></script>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/customs.css">
<script>
	function goDetail(num) {
		location.href = "/detail.do?pn=" +
<%=nowPage%>
	+ "&num=" + num;
	}

	function searchArticle() {
		var filter = $('#filter option:selected').val();
		var keyword = $('#keyword').val();
		location.href = "/list.do?pn=1&filter=" + filter + "&keyword="
				+ keyword;
	}
</script>
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

			<a class="navbar-brand" href="index.jsp">kobalja의 게시판</a>

		</div>

		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li class="active"><a href="/list.do?pn=1">게시판</a></li>
				<li><a href="index.jsp">공지사항</a></li>

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
	<!-- 게시판 화면 -->
	<div class="container">
		<div class="row">
			<form method="post"
				action="/updatePro.do?pn=<%=nowPage%>&num=<%=vo.getArticleNum()%>"
				onsubmit="checkData()">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-allign: center;">게시판
								글수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="subject" id="subject" maxlength="50"
								value="<%=vo.getArticleTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" name="content"
									id="content" placeholder="글 내용" maxlength="2048"
									style="height: 400px;"><%=vo.getArticleContent()%></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="hidden" name="num" value="<%=vo.getArticleNum()%>">
				<input type="submit" class="btn btn-primary pull-right" value="글수정">
			</form>
			<br />

		</div>
		<br />
		<form action="/list.do?pn=<%=nowPage%>">
			<button class="btn btn-primary pull-right">취소</button>
		</form>
	</div>
</body>
</html>