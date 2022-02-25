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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Exchange</title>
<link rel="stylesheet" href="gen.css" />

</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<form action="" method="post">
			<table style="with: 50%">
				<tr>
					<td>Enter stock name:</td>
					<td><input type="text" id="fn" name="fn" /></td>
					
				</tr>
			</table>
			<input type="submit" value="Search" /></form>
			</form>
<br><br>
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
	
String name=request.getParameter("fn");
System.out.println(name);
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from stock where stockname = '"+ name+"';";
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