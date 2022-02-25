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
</form>
<br>

<form action="ECview" method="post">
			<table style="with: 50%">
				<tr>
					<input type="number" name="custId" ></input><br>
					<button class="button button1" >View</button>
				</tr>
			</table>
			</form>
<br>
<form action="ECedit.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button2" >Edit</button>
				</tr>
			</table>
			</form>
<br>

<form action="ECadd.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button1" >Add</button>
				</tr>
			</table>
			</form>
<br>
<form action="ECdelete.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button2" >Delete</button>
				</tr>
			</table>
			</form>




</body>
</html>