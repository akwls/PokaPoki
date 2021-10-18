<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/products.css">
<title>상품 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="products-container">
		<div align="center">
			<%
				for(int i=0; i< listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="product">
				<img src="C:/upload/<%=product.getFilename() %>"  style="width: 100%">
				<h3><%= product.getPname() %></h3>
				<p><%= product.getDescription() %></p>
				<p><%= product.getUnitPrice() %>원</p>
				<p><a href="./product.jsp?id=<%=product.getProductId() %>" class="btn btn-secondary" role="button"> 상세 정보&raquo;</a></p>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>