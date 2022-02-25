<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="gen.css" />
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Stock Exchange</h1>
<h1>Login</h1>
<form action="LoginServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Username</td>
					<td><input type="text" name="usr" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="pwd" /></td>
				</tr>
			</table>
			<input type="submit" value="Login" /></form>
			
			
</body>
</html>
