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
<h1>Customer Portfolio</h1>
<br>Account Number: <%= request.getAttribute("accnum") %>
<br>Account Creation Date:  <%= request.getAttribute("acccredate") %>
<br>Credit Card Number:    <%= request.getAttribute("creditcnum") %>
<br>Stock Symbol:       <%= request.getAttribute("stocksymbol") %>
<br>Number Of Shares:      <%= request.getAttribute("numshares") %>
<br>Stop:    <%= request.getAttribute("stop_") %>
<br>Stop Price:  <%= request.getAttribute("stopprice") %>
<div class="footer">
	<p>We herd you loud and clear. You are ready to take the stock market by the horns.</p>
	<p>That's udderly brilliant! Don't make a misteak, trade with LiveStock&copy;!</p>
</div>
</div>
</body>
</html>