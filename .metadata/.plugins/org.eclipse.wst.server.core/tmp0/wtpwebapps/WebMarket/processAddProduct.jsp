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
		String group = multi.getParameter("group");
		String member = multi.getParameter("member");
		String album = multi.getParameter("album");
		String description = multi.getParameter("description");
		String condition = multi.getParameter("category");
		String p = multi.getParameter("price");
		
		int price;
		if(p.isEmpty()) price = 0;
		else price = Integer.valueOf(p);
		
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO product (p_id, p_group, p_album, p_member, p_price, p_description, p_condition, p_fileName) values (?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, group);
		pstmt.setString(3, album);  
		pstmt.setString(4, member);
		pstmt.setInt(5, price);
		pstmt.setString(6, description);
		pstmt.setString(7, condition);
		pstmt.setString(8, fileName);
		
		pstmt.executeUpdate();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("Products.jsp");
		
	%>