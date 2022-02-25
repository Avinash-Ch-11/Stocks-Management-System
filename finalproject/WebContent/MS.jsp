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
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Stocks</h1>
<table>
<tr>
<td>
<form action="MSsas.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button1" >Search a stock</button>
				</tr>
			</table>
			</form>
</td>
<td>
<form action="MScsp.jsp" method="post">
			<table style="with: 50%">
				<tr>
					
					<button class="button button2" >change stock price</button>
				</tr>
			</table>
			</form>
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
</body>
</html>