<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron" style="background-color: #00acee;">
		<div class="container">
			<h1 class="display-3" style="color: #ffffff;">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드 </label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">그룹 </label>
				<div class="col-sm-3">
					<input type="text" id="group" name="group" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">멤버 </label>
				<div class="col-sm-3">
					<input type="text" id="member" name="member" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">앨범 </label>
				<div class="col-sm-3">
					<input type="text" id="album" name="album" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격 </label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">포카 별명</label>
				<div class="col-sm-3">
					<textarea name="description" rows="2" column="50" class="form-control"></textarea>
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
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>