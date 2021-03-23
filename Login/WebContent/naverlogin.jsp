<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ page import ="java.net.URLEncoder" %>
<%@ page import ="java.security.SecureRandom" %>
<%@ page import ="java.math.BigInteger" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	String clientId="YOUR_CLIENT_ID" ; //"애플리케이션 클라이언트 아이디값";
	redirectURI = URLEncoder.encode("YOUR_CALLBACK_URL", "UTF-8");
	SecureRandom random= new SecureRandom();
	state = new BigInteger(130, random).toString();
	apiURL= "https://nid.naver.com/oauth2.0/authorize?response_type=code" +="&client_id=" + clientId;
	redirectURI;
	state;
	session.setAttribute("state", state); %>
  
<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>



</body>
</html>