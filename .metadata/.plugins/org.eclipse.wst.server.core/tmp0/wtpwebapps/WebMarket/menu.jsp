<%@ page contentType="text/html; charset=utf-8" %>
<nav class="navbar navbar-expand navbar-dark" style="background-color: #777777;">
	<div class="container" >
		<div class="navbar-header">
			<a class="navbar-brand" href="./Welcome.jsp" style="color: #ffffff;">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-itm">
					<a class="nav-link" href="./search.jsp">검색하기</a>
				</li>
				<li class="nav-itm">
					<a class="nav-link" href="./Products.jsp">전체목록</a>
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
				<li class="nav-itm">
					<a class="nav-link" href="./cart.jsp">장바구니</a>
				</li>
			</ul>
		</div>
	</div>
</nav>