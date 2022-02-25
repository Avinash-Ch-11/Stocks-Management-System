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
<h1>Change stock price</h1>
<form  name = "f1" onsubmit = "return validation()" method="post">
			<table style="with: 50%">
				<tr>
					<td>Enter stock name:</td>
					<td><input type="text" id="fn" name="fn" /></td>
					
				</tr>
				<tr>
					<td>Enter New stock price:</td>
					<td><input type="float" id="pr" name="pr" /></td>
					
				</tr>
			</table>
			<input type="submit" value="Change" /></form>
			</form>
<br><br>
<br>


<%
try{
	
String name=request.getParameter("fn");
String price=request.getParameter("pr");
System.out.println(name);
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="update stock set shareprice ="+price+" where stockname = '"+name+"';";
int n=statement.executeUpdate(sql);
if (n>0){
%>
<P>Stock price updated successfully</P>
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
            	var fn = document.f1.fn.value;
                var pr = document.f1.pr.value;
                if(fn.length=="" || pr.length=="") {  
                    alert("Enter valid details");  
                    return false;  
                }  
                                            
            }  
        </script> 

</body>
</html>