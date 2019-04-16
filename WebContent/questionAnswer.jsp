<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<FORM method="POST"
      onSubmit="return checkAnswer(this,'B');"
>

<INPUT TYPE="RADIO" VALUE="A" NAME="cc">
A. Ask a Question<BR>

<INPUT TYPE="RADIO" VALUE="B" NAME="cc">
B. Answer a Question <BR>

<INPUT TYPE="SUBMIT" VALUE="Submit Answer">

</FORM>
<!-- -
<h1>FAQ: Question and Answer</h1>
<br>
	<form method="post" action="questionAnswer.jsp">
	<table>
	<tr>    
	<td>What would you like to do?</td><td><select name="Category" size=1>
			<option value="Ask a Question">Ask a Question</option>
			<option value="Find an Answer">Find an Answer</option></select></td>
	</table>
	<input type="Submit" value="Sell Item and List">
	</form>
<br>
-->
</body>
</html>