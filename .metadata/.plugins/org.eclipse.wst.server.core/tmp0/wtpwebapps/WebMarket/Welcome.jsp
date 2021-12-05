<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>POKA!POKI!</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%!
		String greeting = "포토카드 거래 웹사이트";
		String tagline = "포카포키에 오신 것을 환영합니다!";
	%>
	<div class="jumbotron" style="background-color: #00acee;">
		<div class="container">
			<h1 class="display-3" style="color: #ffffff;"><%= greeting %></h1>
		</div>
	</div>
	<main role="main">
		<div class="container">
			<div class="text-center">
				<h3><%= tagline %></h3>
			</div>
			<hr>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>