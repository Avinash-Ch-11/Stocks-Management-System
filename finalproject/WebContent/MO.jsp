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
<h1>Orders</h1>

<br>
<table border="1">
<tr>
<td>Order Id</td>
<td>Stock Symbol</td>
<td>Order Type</td>
<td>Number of Shares</td>
<td>Cus Acc Num</td>
<td>Time</td>
<td>Price type</td>
<td>Stop Price</td>
<td>Stop diff</td>
<td>Cus share price</td>
<td>EMP ID</td>
<td>Recorded</td>
<td>Completed</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from order_;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("orderid") %></td>
<td><%=resultSet.getString("StockSymbol") %></td>
<td><%=resultSet.getString("OrderType") %></td>
<td><%=resultSet.getString("NumShares") %></td>
<td><%=resultSet.getString("CusAccNum") %></td>
<td><%=resultSet.getString("Timestamp_") %></td>
<td><%=resultSet.getString("PriceType") %></td>
<td><%=resultSet.getString("StopPrice") %></td>
<td><%=resultSet.getString("StopDiff") %></td>
<td><%=resultSet.getString("CurSharePrice") %></td>
<td><%=resultSet.getString("EmpId") %></td>
<td><%=resultSet.getString("Recorded") %></td>
<td><%=resultSet.getString("Completed") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>