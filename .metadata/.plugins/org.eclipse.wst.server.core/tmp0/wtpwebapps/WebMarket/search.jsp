<%@page import ="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>검색하기</title>
<script>
	let search = document.getElementById("search");
	let v = search.value;
	let btn = document.getElementById("btn");
	function searchFunc() {
		let search = document.getElementById("search");
		let v = search.value;
		v = encodeURIComponent(encodeURIComponent(v));
		location.href="./searchResult.jsp?search=" + v;
	}

</script>
</head>
<body>
	<%  request.setCharacterEncoding("UTF-8");%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background-color: #00acee;">
		<div class="container">
			<h1 class="display-3" style="color: #ffffff;">검색하기</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-4">
				<div class="form-group row">
					<label class="col-sm-2"></label>
					<div class="col-sm-10">
						<input type="text" id="search" name="search" class="form-control" placeholder="검색어를 입력하세요."/>
					</div>
				</div>
				<p><a id="btn" class="btn btn-primary" role="button" onclick="searchFunc()" style="color: #ffffff;">검색하기&raquo;</a></p>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>