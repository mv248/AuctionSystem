<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Account Information</title>
</head>
<body>
<h2> Edit Account Information </h2>

	<form action="changeAccInfo.jsp" method="POST">
		User's Username: <input type="text" name="userId" /> <br />
		New Password: <input type="text" name="password" /> <br />
		New Card Number: <input type="text" name="cardNum" /> <br />
		<input type="submit" value="Save Changes" /> <br />
	</form> <br />

</body>
</html>