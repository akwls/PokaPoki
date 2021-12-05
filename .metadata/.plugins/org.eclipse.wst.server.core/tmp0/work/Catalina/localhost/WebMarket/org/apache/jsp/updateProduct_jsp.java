/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.44
 * Generated at: 2021-12-05 12:26:11 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class updateProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/dbconn.jsp", Long.valueOf(1638431272000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"./resources/css/bootstrap.min.css\">\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"./resources/js/validation.js\"></script>\r\n");
      out.write("<title>상품 수정</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write("\r\n");
      out.write("<div class=\"jumbotron\" style=\"background-color: #00acee;\">\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<h1 class=\"display-3\" style=\"color: #ffffff;\">상품 수정</h1>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	Connection conn = null;
	try {
		String url = "jdbc:mysql://localhost:3306/poka_db?serverTimezone=Asia/Seoul&useSSL=false";
		String user = "root";
		String password = "mirim";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		
	} catch(SQLException ex) {
		out.println("MySQL ì°ë ì¤í¨");
		out.println("SQLExcpetion : " + ex.getMessage());
	}







      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('	');

		String productId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM product where p_id = ?";
		pstmt = conn.prepareCall(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
	
	
      out.write("\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<form name=\"updateProduct\" action=\"./processUpdateProduct.jsp\" class=\"form-horizontal\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">상품 코드 </label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"productId\" name=\"productId\" class=\"form-control\" value=\"");
      out.print( rs.getString("p_id"));
      out.write("\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">그룹 </label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"group\" name=\"group\" class=\"form-control\" value=\"");
      out.print( rs.getString("p_group"));
      out.write("\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">멤버 </label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"member\" name=\"member\" class=\"form-control\" value=\"");
      out.print( rs.getString("p_member"));
      out.write("\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">앨범 </label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"album\" name=\"album\" class=\"form-control\" value=\"");
      out.print( rs.getString("p_album"));
      out.write("\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">가격 </label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" id=\"price\" name=\"price\" class=\"form-control\" value=\"");
      out.print( rs.getString("p_price"));
      out.write("\"/>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">포카 별명</label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<textarea name=\"description\" rows=\"2\" column=\"50\" class=\"form-control\" >");
      out.print( rs.getString("p_description"));
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">분류</label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"category\" value=\"Album\" />앨범 포카\r\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"category\" value=\"Goods\" />굿즈 포카\r\n");
      out.write("\t\t\t\t\t<input type=\"radio\" name=\"category\" value=\"Other\" />기타\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<label class=\"col-sm-2\">이미지</label>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-5\">\r\n");
      out.write("\t\t\t\t\t<input type=\"file\" name=\"productImage\" class=\"form-control\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t<div class=\"form-group row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-offset-2 col-sm-10\">\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" class=\"btn btn-primary\" value=\"등록\" />\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t");

	}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<hr>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
