<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Landing Page</title>
</head>
<body>
	
	<h1>Auction System</h1>
	
	
	</head>
<body>
   
         
    	<div class="content">
    		<form action="cancelAuction.jsp" method="POST">
           		<label>itemId</label>
           		<input type="text" name="itemId" placeholder="itemId" required><br>
            	          	    			
    			<input type="submit" value="Cancel Auction">
    		</form>
    		
    	</div>
    
</body>
	
	
	<!-- 
	<h2>Create Customer Representative Account</h2>
	<form action="CreateAccount.jsp" method="POST">
		Username: <input type="text" name="username"/> <br/> 
		Password:<input type="password" name="password"/> <br/>
		<input type="hidden" name="userType" value="customerRep" /> <br/> 
		<input type="submit" formaction="CreateAccount.jsp" value="Create Login"> <br/> 
	</form> <br />
	<!-- 	
	String insert = "DELETE FROM Item WHERE year= ?";
	
	ps.setString(1, year);
	ps.executeUpdate();
	 -->
	
</body>
</html>