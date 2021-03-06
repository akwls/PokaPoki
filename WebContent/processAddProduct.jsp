<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*" %>
<%@include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
	
		String filename = "";
		String realFolder = "C:\\upload";
		int maxsize = 5 * 1024 * 1024;
		String encType = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, encType, new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		int price;
		if(unitPrice.isEmpty()) price = 0;
		else price = Integer.valueOf(unitPrice);
				
		long stock;
		if(unitsInStock.isEmpty()) {
			stock = 0;
		}
		else stock = Long.valueOf(unitsInStock);
		
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO product (p_id, p_name, p_unitPrice, p_description, p_manufacturer, p_category, p_unitsInStock, p_condition, p_fileName) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);
		pstmt.setString(5, manufacturer);
		pstmt.setString(6, category);
		pstmt.setLong(7, stock);
		pstmt.setString(8, condition);
		pstmt.setString(9, fileName);
		
		pstmt.executeUpdate();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("Products.jsp");
		
	%>