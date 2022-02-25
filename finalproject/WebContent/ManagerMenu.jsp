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
<h1>Manager</h1>


<%   
  
String name=request.getParameter("usr");  
out.print("Welcome "+name);  
  
session.setAttribute("user",name);  
  
 
  
%> 
Your ID is: ${empid}
<br>
<form action="MAinfo" method="post">
			<table style="with: 50%">
				<tr>
					
					 <input type="hidden" id="custId" name="custId" value="${user}"></input>
					<button class="button button1">Account info</button>
				</tr>
			</table>
			</form>
<br>
<form action="ME.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button2" >Employees</button>
				</tr>
			</table>
			</form>

<br>
<form action="MO.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button1" >Orders</button>
				</tr>
			</table>
			</form>
<br>
<form action="MS.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button2" >Stocks</button>
				</tr>
			</table>
			</form>
<br>

<br>
<button class="button button2">Logout</button>
<br>






</body>
</html>