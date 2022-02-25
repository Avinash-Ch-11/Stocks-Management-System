<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue a book Form</title>
</head>
<body>
<jsp:include page="LoginHeader.jsp"></jsp:include>
<h1>Details Of Issuing Book</h1>
<form action="IssueServlet" method="post">
			<table style="with: 50%">
				<tr>
					<td>Student Id</td>
					<td><input type="text" name="student_id" /></td>
				</tr>
				<tr>
					<td>Book Id</td>
					<td><input type="text" name="book_id" /></td>
				</tr>
				<tr>
					<td>Issue Date</td>
					<td><input type="text" name="issue_date" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" /></form>
</body>
</html>
