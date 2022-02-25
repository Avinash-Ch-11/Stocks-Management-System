<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
<td>Time</td>
<td>Order Type</td>
<td>Stock Symbol</td>
<td>Number of Shares</td>
<td>Price Type</td>
<td>Stop Price</td>
</tr>
<%
try{
String usr = request.getParameter("usr");
int cusid =0;
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
PreparedStatement pstmt = connection.prepareStatement("select * from login where usr = ?");
pstmt.setString(1,usr);
ResultSet rs= pstmt.executeQuery();
while(rs.next()) {
	cusid=rs.getInt("id");//getting student name and storing in a variable
}
System.out.println(cusid);
String sql ="select * from order_ where cusaccnum = "+cusid+";";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%= resultSet.getString("timestamp_") %></td>
<td><%= resultSet.getString("ordertype") %></td>
<td><%= resultSet.getString("stocksymbol") %></td>
<td><%= resultSet.getInt("numshares") %></td>
<td><%= resultSet.getString("pricetype") %></td>
<td><%= resultSet.getString("stopprice") %></td>
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