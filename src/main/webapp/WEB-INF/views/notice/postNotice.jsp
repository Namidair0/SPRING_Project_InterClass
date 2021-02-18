<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>InterClass</title>
<style type="text/css">
	#container{width: 100%; margin: 0 auto; text-align: center;}
	table{margin: 0 auto; width: 800px; border-collapse: collapse; text-align: center;}
	tr, td{border: 1px solid gray; padding: 10px;}
	h1{padding: 20px 0; font-weight: bold; text-align: center;}
	input[type="text"]{width: 100%; height: 20px;}
	textarea{width: 100%; height: 300px;}
</style>
</head>
<body>
<%@include file="../menu.jsp" %>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<h1>글 작성</h1>
	<div id="container">
		<form action="insertBoard" method="post">
			<table>
				<tr>
					<td><input type="text" name="title" placeholder="제목"></td>
				</tr>
				<tr>
					<td><input type="text" name="writer" value="관리자" readonly></td>
				</tr>
				<tr>
					<td><textarea name="content" placeholder="내용"></textarea></td>
				</tr>

				<tr>
					<td>
					<input type="submit" value="등록">
					<input type="button" value="뒤로" onclick="location.href='getBoardList'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">
<p>사용할 수 없는 페이지 입니다.
</sec:authorize>
<sec:authorize access="isAnonymous()">
<p>사용할 수 없는 페이지 입니다.
</sec:authorize>
<%@include file="../footer.jsp" %>
</body>
</html>