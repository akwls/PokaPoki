
<%@page import="java.sql.*" %>

<%
	Connection conn = null;
	try {
		String url = "jdbc:mysql://localhost:3306/poka_db?serverTimezone=Asia/Seoul&useSSL=false";
		String user = "root";
		String password = "mirim";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch(SQLException ex) {
		out.println("MySQL 연동 실패");
		out.println("SQLExcpetion : " + ex.getMessage());
	}






%>
