<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Bid Information</title>
</head>
<body>
<h2> Edit Bid Information </h2>

	<form action="submitEditBid.jsp" method="POST">
		Bid Id: <input type="number" name="bidId" required/> <br />
		New Amount: <input type="number" name="newAmount" /> <br />
		New Upper Limit: <input type="number" name="newUpperLimit" /> <br />
		<input type="submit" value="Save Changes" /> <br />
	</form> <br />

</body>
</html>