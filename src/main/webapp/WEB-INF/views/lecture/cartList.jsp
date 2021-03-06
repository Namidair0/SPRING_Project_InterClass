<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Date nowTime = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>チェックリスト</title>
</head>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<style>
	.container{
	font-family: 'Gothic A1', sans-serif;
	</style>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
	<style type="text/css">
	.orderInfo{
		display:none;
	}
</style>

<body>
<jsp:include page="../menu.jsp"/>

<div class="container">
	<div class="page-header" align=center>
		<h2>チェックリスト</h2>
	</div>
	<br>
	<br>
	<table class="table table-hover" id="cart">
		
		<thead>
			<tr>
				<th class="content">ID</th>
				<th class="content">カートナンバー</th>
				<th class="content">講義ナンバー</th>
				<th></th>		
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${cartList}" var="cartList">
				<tr>
					<td class="content">${cartList.mId}</td>
					<td class="content" id="${cartList.cartNum}">${cartList.cartNum}</td>
					<td class="content" id="${cartList.lectureNum}">${cartList.lectureNum}</td>
					<td class="content">
				
				
					<div class="order">
						<button type="button" class="btn btn-info">予約</button>
							<script>
							$(".btn-info").click(function(){
							$(".orderInfo").slideDown();
							$(".btn-info").slideUp();
							});      
							</script>
					</div>
					
					<div class="delete">
					<button type="button" class="delete_${cartList.cartNum}_btn btn btn-danger" data-cartNum="${cartList.cartNum}">削除</button>
						<script>
							$(".delete_${cartList.cartNum}_btn").click(function(){
								var confirm_val = confirm("本当に削除しますか？");
								 
									if(confirm_val) {
										var checkArr = new Array();
										
										checkArr.push($(this).attr("data-cartNum"));
										          
										$.ajax({
											url : "/lecture/deleteCart",
											type : "post",
											data : { chbox : checkArr },
											success : function(result){
											if(result == 1) {     
												location.href = "/lecture/list";
												location.reload();
											} else {
											alert("削除失敗");
											}
										}
									});
								} 
							});
						</script>
					</div>
				 				
						<div class="orderInfo">
							<form role="form" name="orderForm" action="${path}/reser/reservation" method="post" autocomlete="off">
								<input type="hidden" name="cartNum" value="${cartList.cartNum}"/>
								<input type="hidden" name="lectureNum" value="${cartList.lectureNum}"/>
								<div class="inputArea">
									<label for="srartDate">開始日</label>
									<input type="date" id="startDate" name="startDate" value="<%=format.format(nowTime)%>" min="<%=format.format(nowTime) %>"/>
								</div>
								<div class="inputArea">
									<button type="submit" class="order" onclick="check()">予約</button>
										<script>
										function check() {
										       if (document.getElementById("startDate").value == "") {
										           alert("講義を始める日付をお選びください。");
										           return false;
												}else {
												  document.orderForm.submit();
										        }
										</script>
								</div>
							</form>
						</div>
					</td>			
				</tr>
			</c:forEach>
		</tbody>
	</table>	
</div>
</body>

<footer style="position:fixed; left:0px; bottom:0px; hegith:60px; width:100%;"><jsp:include page="../footer.jsp"></jsp:include></footer>

</html>