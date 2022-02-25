<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a new employee</title>
<link rel="stylesheet" href="gen.css" />
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Add the details</h1>
<form name="f1" action="MEdelete" onsubmit = "return validation()" method="post">
			<table style="with: 50%">
				<tr>
					<td>ID</td>
					<td><input type="text" id = "id" name="id" /></td>
				</tr>
				
			</table>
			<input type="submit" value="Delete" /></form>
			
<script>  
            function validation()  
            {  
                var id = document.f1.id.value;
                if(id.length=="") {  
                    alert("Enter all fields");  
                    return false;  
                }  
                                            
            }  
        </script>  
			
			
</body>
</html>
