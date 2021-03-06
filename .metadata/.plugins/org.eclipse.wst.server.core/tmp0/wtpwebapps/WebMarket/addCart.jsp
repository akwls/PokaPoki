<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product" %>
<%@page import ="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconn.jsp" %>
<%
	String id = "";
	id = request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return ;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM product where p_id = ?;";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs= pstmt.executeQuery();
	rs.next();

	/*
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
	*/
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list == null) {
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i=0; i<list.size(); i++) {
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0) {
		Product goods = new Product(rs.getString("p_id"), rs.getString("p_member"), rs.getInt("p_price"));
		// goods.setpMember(rs.getString("p_mem"));
		goods.setDescription(rs.getString("p_description"));
		goods.setpGroup(rs.getString("p_group"));
		goods.setQuantity(1);
		goods.setCategory(rs.getString("p_condition"));
		list.add(goods);
	}
	// String rePage = "";
	
	response.sendRedirect("product.jsp?id=" + id);
	// 원래 화면으로 복귀
%>