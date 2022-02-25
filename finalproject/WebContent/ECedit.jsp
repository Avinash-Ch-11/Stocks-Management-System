<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit details</title>
<link rel="stylesheet" href="gen.css" />
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Add the details</h1>
<form name="f12" action="ECedit" onsubmit = "return validation2()" method="post">
			<table style="with: 50%">
				<tr>
					<td>ID</td>
					<td><input type="number" id="id" name="id" /></td>
				</tr>
				<tr>
					<td>firstname</td>
					<td><input type="text" id="fn" name="fn" /></td>
				</tr>
				<tr>
					<td>lastname</td>
					<td><input type="text" id="ln"  name="ln" /></td>
				</tr>
				<tr>
					<td>address</td>
					<td><input type="text" id="add" name="add" /></td>
				</tr>
				<tr>
					<td>city</td>
					<td><input type="text" id="city"  name="city" /></td>
				</tr>
				<tr>
					<td>state</td>
					<td><input type="text" id="state" name="state" /></td>
				</tr>
				<tr>
					<td>zipcode</td>
					<td><input type="text" id="zc" name="zc" /></td>
				</tr>
				<tr>
					<td>telephone</td>
					<td><input type="text" id="tp" name="tp" /></td>
				</tr>
				

				<tr>
					<td>Rating</td>
					<td><input type="number" id="rt" name="rt" /></td>
				</tr>
				<tr>
					<td>User name</td>
					<td><input type="text" id="un" name="un" /></td>
				</tr>
				<tr>
					<td>password</td>
					<td><input type="text" id="pwd" name="pwd" /></td>
				</tr>
			</table>
			<input type="submit" value="EDIT" /></form>
			
<script>  
            function validation2()  
            {  
            	var id = document.f12.id.value;
                var fn = document.f12.fn.value;
                var ln = document.f12.ln.value;
                var add = document.f12.add.value;
                var city = document.f12.city.value;
                var state = document.f12.state.value;
                var zc = document.f12.zc.value;
                var tp = document.f12.tp.value;
                
                var rt = document.f12.rt.value;
                var un = document.f12.un.value;
                var pwd = document.f12.pwd.value;
                if(id.length=="" || fn.length=="" || ln.length=="" || add.length=="" || city.length=="" || state.length=="" || zc.length=="" || tp.length=="" ||  rt.length=="" || un.length=="" || pwd.length=="") {  
                    alert("Enter all fields");  
                    return false;  
                }  
                                            
            }  
        </script>  
			
			
</body>
</html>
