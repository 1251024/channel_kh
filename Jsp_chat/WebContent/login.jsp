<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="login.do">
		<input type="hidden" name="command" value="loginres">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>부서선택</td>
				<td>
				<select name="dept">
					<option value="management">관리</option>
					<option value="sales">영업</option>
					<option value="development">개발</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="로그인">
					<input type="button" value="홈으로" onclick="history.back();">
				</td>
			</tr>
			
			
		</table>
		
		
		
		
	</form>

</body>
</html>