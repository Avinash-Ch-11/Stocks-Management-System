<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Exchange</title>
<link rel="stylesheet" href="gen.css" />
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<br>First Name: <%= request.getAttribute("firstname") %>
<br>Last Name: <%= request.getAttribute("lastname") %>
<br>address: <%= request.getAttribute("address") %>
<br>city: <%= request.getAttribute("city") %>
<br>state: <%= request.getAttribute("state") %>
<br>zipcode: <%= request.getAttribute("zipcode") %>
<br>telephone: <%= request.getAttribute("telephone") %>
<br>position: <%= request.getAttribute("position") %>
<br>ssn: <%= request.getAttribute("ssn") %>
<br>empid: <%= request.getAttribute("empid") %>
</body>
</html>