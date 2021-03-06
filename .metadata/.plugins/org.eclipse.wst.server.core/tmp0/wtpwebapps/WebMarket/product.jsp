<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import ="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		}
		else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background-color: #00acee;">
		<div class="container">
			<h1 class="display-3" style="color: #ffffff;">상품 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		//pstmt = conn.prepareCall(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="C:/upload/<%=rs.getString("p_fileName") %>"  style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><span><%= rs.getString("p_group") %> <%= rs.getString("p_member") %></span></h3>
				<p><%= rs.getString("p_description") %></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger">
				<%= rs.getString("p_id") %></span><p>
				<p><b>앨범 : </b><%= rs.getString("p_album") %></p>
				<p><b>분류 : </b><%= rs.getString("p_condition") %></p>
				<h4><%= rs.getString("p_price") %>원</h4>
				<p>
				<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="POST">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>
					<a href="./cart.jsp" class= "btn btn-warning">장바구니&raquo;</a>
					<a href="./Products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
				</form>
			</div>
		</div>
	</div>
	<%
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
	<%@ include file="footer.jsp" %>
</body>
</html>