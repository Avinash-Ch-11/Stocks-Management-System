<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>
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
<h1>Change stock price</h1>
<form  name = "f1" onsubmit = "return validation()" method="post">
			<table style="with: 50%">
				<tr>
					<td>Enter stock symbol:</td>
					<td><input type="text" id="ss" name="ss" /></td>
					
				</tr>
				<tr>
					<td>Enter stock name:</td>
					<td><input type="text" id="sn" name="sn" /></td>
					
				</tr>
				<tr>
					<td>Enter stock type:</td>
					<td><input type="text" id="st" name="st" /></td>
					
				</tr>
				<tr>
					<td>Enter  stock price:</td>
					<td><input type="float" id="sp" name="sp" /></td>
					
				</tr>
				<tr>
					<td>Enter no of avail shares:</td>
					<td><input type="number" id="as" name="as" /></td>
					
				</tr>
			</table>
			<input type="submit" value="Add" /></form>
			</form>
<br><br>
<br>


<%
try{
	
String ss=request.getParameter("ss");
String sn=request.getParameter("sn");
String st=request.getParameter("st");
String p=request.getParameter("sp");
String s=request.getParameter("as");
int as = Integer.parseInt(s);
float sp =Float.parseFloat(p);
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
PreparedStatement pstmt2 = connection.prepareStatement("INSERT INTO stock (stocksymbol, stockname, stocktype, shareprice, numavailshares) VALUES (?,?,?,?,?);");
pstmt2.setString(1,ss);
pstmt2.setString(2,sn);
pstmt2.setString(3,st);
pstmt2.setInt(5,as);
pstmt2.setFloat(4,sp);
int n = pstmt2.executeUpdate();
if (n>0){
%>
<P>Stock added successfully</P>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>



<script>  
            function validation()  
            {  
            	var ss = document.f1.ss.value;
            	var sn = document.f1.sn.value;
            	var st = document.f1.st.value;
            	var sp = document.f1.sp.value;
                var as = document.f1.as.value;
                if(sn.length=="" || ss.length==""  || st.length==""  || sp.length==""  || ss.length=="" || as.length=="") {  
                    alert("Enter all details");  
                    return false;  
                }  
                                            
            }  
        </script> 

</body>
</html>