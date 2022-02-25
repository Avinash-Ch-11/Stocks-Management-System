<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a new customer</title>
<link rel="stylesheet" href="gen.css" />
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Add the details</h1>
<form name="f1" action="ECas" onsubmit = "return validation()" method="post">
			<table style="with: 50%">
				
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
					<td>email id:</td>
					<td><input type="text" id="ps" name="em" /></td>
				</tr>
				<tr>
					<td>Rating :</td>
					<td><input type="number" id="rt" name="rt" /></td>
				</tr>
				<tr>
					<td>credit card no: :</td>
					<td><input type="number" id="cd" name="cd" /></td>
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
			<input type="submit" value="ADD" /></form>
			
<script>  
            function validation()  
            {  
                
                var fn = document.f1.fn.value;
                var ln = document.f1.ln.value;
                var add = document.f1.add.value;
                var city = document.f1.city.value;
                var state = document.f1.state.value;
                var zc = document.f1.zc.value;
                var tp = document.f1.tp.value;
                var em = document.f1.em.value;
                var rt = document.f1.rt.value;
                var un = document.f1.un.value;
                var pwd = document.f1.pwd.value;
                var cd = document.f1.cd.value;
                if(cd.length="" || fn.length=="" || ln.length=="" || add.length=="" || city.length=="" || state.length=="" || zc.length=="" || tp.length=="" || em.length=="" || rt.length=="" || un.length=="" || pwd.length=="") {  
                    alert("Enter all fields");  
                    return false;  
                }  
                                            
            }  
        </script>  
			
			
</body>
</html>
