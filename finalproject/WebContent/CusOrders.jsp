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
<div class="body">
<h1>Customer Orders</h1>
<br>Time: <%= request.getAttribute("timestamp_") %>
<br>Order Type:  <%= request.getAttribute("ordertype") %>
<br>Stock Symbol:    <%= request.getAttribute("stocksymbol") %>
<br>Number Of Shares:       <%= request.getAttribute("numshares") %>
<br>Price Type:      <%= request.getAttribute("pricetype") %>
<br>Stop Price:  <%= request.getAttribute("stopprice") %>
<div class="footer">
	<p>We herd you loud and clear. You are ready to take the stock market by the horns.</p>
	<p>That's udderly brilliant! Don't make a misteak, trade with LiveStock&copy;!</p>
</div>
</div>
</body>
</html>