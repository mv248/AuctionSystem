<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@  page import="com.hello.jsp.*"%>
 <!DOCTYPE html>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Landing Page</title>
</head>
<body>
	<h1>Auction System</h1>

	<h2>Login or Create an Account</h2>
	<form action="CheckLoginDetails.jsp" method="POST">
		Username: <input type="text" name="username" /> <br /> 
		Password:<input type="password" name="password" /> <br /> 
		<input type="submit" value="Submit" /> <br /> 
		<input type="submit" formaction="CreateAccount.jsp" value="Create Login"> <br /> 
	</form> <br />
	
</body>
</html>