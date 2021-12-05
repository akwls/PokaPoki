<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String id= request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return ;
	}
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);
	
	if(product == null) {
		response.sendRedirect("exeptionNoProductId.jsp");
	}
	ArrayList<Product> goodsList= dao.getAllProducts();
	Product goods = new Product();
	
	for(int i=0; i<goodsList.size(); i++) {
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)) {
			 break;
		}
	}
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	
	for(int i=0; i<cartList.size(); i++) {
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}
	response.sendRedirect("cart.jsp");
	// 원래 화면으로 복귀
%>