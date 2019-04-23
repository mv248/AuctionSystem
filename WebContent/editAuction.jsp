<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Auction Information</title>
</head>
<body>
<h2> Edit Auction Information </h2>

	<form action="submitEditAuction.jsp" method="POST">
		Item Id: <input type="number" name="itemId" required/> <br />
		Starting Price Value ($$.$$) <input type="number" name="newStartPrice"> <br />
		Reserve Price Value ($$.$$) <input type="number" name="newReserve"> <br />
		New Bid Increment: <input type="number" name="newBidInc" /> <br />
		New End Date/Time: <input type="datetime-local" name="newEndDate"> <br />
		<input type="submit" value="Save Changes" /> <br />
	</form> <br />

</body>
</html>