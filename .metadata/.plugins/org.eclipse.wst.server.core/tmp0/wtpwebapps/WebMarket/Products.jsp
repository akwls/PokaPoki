<%@page import ="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background-color: #00acee;">
		<div class="container">
			<h1 class="display-3" style="color: #ffffff;">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM product;";
				pstmt = conn.prepareStatement(sql);
				rs= pstmt.executeQuery();
				while(rs.next()) {
			%>
			<div class="col-md-4">
				<img src="C:/upload/<%=rs.getString("p_fileName") %>" style="width: 100%">
				<h3><span><%= rs.getString("p_group") %> <%=rs.getString("p_member") %></span></h3>
				<p><%= rs.getString("p_description") %></p>
				<p><%= rs.getString("p_album") %></p>
				<p><%= rs.getString("p_price") %>원</p>
				<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>" class="btn btn-secondary" role="button"> 상세 정보&raquo;</a></p>
			</div>
			<%
				}
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			%>
		</div>
		<hr>
		<jsp:include page="sort.jsp"/>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>