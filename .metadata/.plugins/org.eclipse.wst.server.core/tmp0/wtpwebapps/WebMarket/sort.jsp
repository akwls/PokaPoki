<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
     function sortList(data) {
    	 location.href="./ProductsSort.jsp?sorting=" + data;
     }
     function toTop() {
    	 location.href = "./Products.jsp";
     }
    </script>
<div class="container">
	<div class="form-group row">
		<p><a id="btn4" class="btn btn-primary" role="button" onclick="toTop()" style="color: #ffffff; margin-right: 10px;" >맨 위로</a></p>
		<p><a id="btn1" class="btn btn-primary" role="button" onclick="sortList('Album')" style="color: #ffffff; margin-right: 10px;">앨범 포카</a></p>
		<p><a id="btn2" class="btn btn-primary" role="button" onclick="sortList('Goods')" style="color: #ffffff; margin-right: 10px;">굿즈 포카</a></p>
		<p><a id="btn3" class="btn btn-primary" role="button" onclick="sortList('Other')" style="color: #ffffff;">기타</a></p>
		
	</div>
</div>