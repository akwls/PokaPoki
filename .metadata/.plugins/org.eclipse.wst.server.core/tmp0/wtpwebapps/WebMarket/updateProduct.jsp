<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 수정</title>
</head>
<body>
<jsp:include page="menu.jsp" />
<div class="jumbotron" style="background-color: #00acee;">
	<div class="container">
		<h1 class="display-3" style="color: #ffffff;">상품 수정</h1>
	</div>
</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM product where p_id = ?";
		pstmt = conn.prepareCall(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
	
	%>
	<div class="container">
		<form name="updateProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드 </label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" value="<%= rs.getString("p_id")%>"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">그룹 </label>
				<div class="col-sm-3">
					<input type="text" id="group" name="group" class="form-control" value="<%= rs.getString("p_group")%>"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">멤버 </label>
				<div class="col-sm-3">
					<input type="text" id="member" name="member" class="form-control" value="<%= rs.getString("p_member")%>"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">앨범 </label>
				<div class="col-sm-3">
					<input type="text" id="album" name="album" class="form-control" value="<%= rs.getString("p_album")%>"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격 </label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control" value="<%= rs.getString("p_price")%>"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">포카 별명</label>
				<div class="col-sm-3">
					<textarea name="description" rows="2" column="50" class="form-control" ><%= rs.getString("p_description")%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="radio" name="category" value="Album" />앨범 포카
					<input type="radio" name="category" value="Goods" />굿즈 포카
					<input type="radio" name="category" value="Other" />기타
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
				</div>
			</div>
		</form>
	</div>
		
		
	<%
	}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		%>

	<hr>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>