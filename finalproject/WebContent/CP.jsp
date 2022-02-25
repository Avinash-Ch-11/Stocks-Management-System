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

%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="gen.css" /></head>

<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Portfolio</h1>

<br>
<table border="1">
<tr>
<td>ID</td>
<td>Stock Symbol</td>
<td>Num of shares</td>
<td>Stop</td>
<td>Stop price</td>
</tr>
<%
try{
	String usr = request.getParameter("usr");

	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	int cusid=0,accnum=0,numshares=0,stopprice=0;
	PreparedStatement pstmt = connection.prepareStatement("select id from login where usr = ?");
	pstmt.setString(1,usr);
	
	ResultSet rs= pstmt.executeQuery();
	while(rs.next()) {
		cusid=rs.getInt("id");//getting student name and storing in a variable
	}
	System.out.println("id = "+cusid);
	String ss = "select accnum from account_ where cusid ="+cusid+";";
	ResultSet result = null;
	result = statement.executeQuery(ss);
	while(result.next()) {
		accnum=result.getInt("accnum");
	}
	System.out.println(accnum);
	String sql ="select * from portfolio where accnum = "+accnum+";";
	ResultSet resultSe = statement.executeQuery(sql);
	while(resultSe.next()){
%>
<tr>
<td><%= resultSe.getString("accnum") %></td>
<td><%= resultSe.getString("stocksymbol") %></td>
<td><%= resultSe.getString("numshares") %></td>
<td><%= resultSe.getString("stop_") %></td>
<td><%= resultSe.getString("stopprice") %></td>
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