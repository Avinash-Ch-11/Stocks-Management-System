<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/";
String database = "stocktrading";
String userid = "manager";
String password = "";

try {
Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="gen.css" /></head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<div class="body" align="center">
<div class="body">
<h1>Stocks</h1>
<table>
<tr>
<td>
</td>
</tr>
</table>
<br>
<table border="1">
<tr>
<td>Stock Symbol</td>
<td>Stock Name</td>
<td>Stock Type</td>
<td>Stock Price</td>
<td>Available Shares</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from stock;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("stocksymbol") %></td>
<td><%=resultSet.getString("stockname") %></td>
<td><%=resultSet.getString("stocktype") %></td>
<td><%=resultSet.getString("shareprice") %></td>
<td><%=resultSet.getString("numavailshares") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<td>
<form action="StocksServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Enter Stock Symbol which you want to buy:</td>
					<br><td><input type="text" name="stocksymbol"></td>
				</tr>
				<tr>
					<td>Enter your account number:</td>
					<br><td><input type="number" name="accnum"></td>
				</tr>
				
			</table>
			<input type="submit" value="Buy" />
</form>
</td>
<div class="footer">
	<p>We herd you loud and clear. You are ready to take the stock market by the horns.</p>
	<p>That's udderly brilliant! Don't make a misteak, trade with LiveStock&copy;!</p>
</div>
</div>
</body>
</html>