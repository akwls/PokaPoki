<%@ page contentType="text/html; charset=utf-8" %>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./Welcome.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-itm">
					<a class="nav-link" href="./Products.jsp">상품목록</a>
				</li>
				<li class="nav-itm">
					<a class="nav-link" href="./addProduct.jsp">상품등록</a>
				</li>
				<li class="nav-itm">
					<a class="nav-link" href="./editProduct.jsp?edit=update">상품수정</a>
				</li>
				<li class="nav-itm">
					<a class="nav-link" href="./editProduct.jsp?edit=delete">상품삭제</a>
				</li>
			</ul>
		</div>
	</div>
</nav>