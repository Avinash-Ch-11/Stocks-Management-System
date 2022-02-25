<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Exchange</title>
<link rel="stylesheet" href="gen.css" />
<style>
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.button1:hover {
  background-color: #4CAF50;
  color: white;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.button2:hover {
  background-color: #008CBA;
  color: white;
}

</style>
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Customer </h1>
<%   
String name=request.getParameter("usr");  
out.print("Welcome "+name);  
session.setAttribute("user",name);  
%> 
Your ID is: ${cusid}
<br />
<br />
<h2>Select a option</h2>
	<form action = "CAinfo" method="post">
	<table style="with: 50%">
	<tr>
	<input type="hidden" id="cusid" name="cusid" value="${user}"></input>
	<button class="button button1">Account info</button>
	</tr>
	</table>
	</form>

<br />


<br />

	<form action="CP.jsp" method="post">
	<table style="with: 50%">
	<tr>
	 <td><input type="hidden" name="usr" value="${user}"></td>
	<button class="button button2" >Portfolio</button>
	</tr>
	</table>
	</form>
	
<br />
<br />

			<form action="CO.jsp" method="post">
			<table style="with: 50%">
			<tr>
			<td><input type="hidden" name="usr" value="${user}"></td>
			<button class="button button2" >Orders</button>
			</tr>
			</table>
			</form>

<br />
<br />

	<form action="CS.jsp" method="post">
	<table style="with: 50%">
	<tr>
	<button class="button button2" >Stocks</button>
	</tr>
	</table>
	</form>

<br />

<br />

		<form action="logoutprocess.jsp" method="post">
		<table style="with: 50%">
		<tr>
		<button class="button button2" >Logout</button>
		</tr>
		</table>
		</form>

<br />
<br />
</body>
</html>