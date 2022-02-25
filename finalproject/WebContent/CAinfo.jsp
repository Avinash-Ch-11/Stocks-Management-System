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
My ID is <%= request.getAttribute("id") %>
<br>First Name: <%= request.getAttribute("firstname") %>
<br>Last Name: <%= request.getAttribute("lastname") %>
<br>address: <%= request.getAttribute("address") %>
<br>city: <%= request.getAttribute("city") %>
<br>state: <%= request.getAttribute("state") %>
<br>zipcode: <%= request.getAttribute("zipcode") %>
<br>telephone: <%= request.getAttribute("telephone") %>
<br>email: <%= request.getAttribute("email") %>
<br>rating: <%= request.getAttribute("rating") %>
</body>
</html>