import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public IssueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String student_id = request.getParameter("student_id");
		String book_id = request.getParameter("book_id");
		String issue_date = request.getParameter("issue_date");
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
		
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to PostgreSQL database
 		System.out.println("Printing connection object "+con);
 		PreparedStatement pstmt = con.prepareStatement("select student_id from student where student_id = ?");
 		pstmt.setString(1,student_id);
 		ResultSet rs= pstmt.executeQuery();
 		if(rs.next())
 		{
 			//Prepared Statement to add issue data
			PreparedStatement st = con .prepareStatement("insert into issue values(?,?,?,?)");
	 		st.setString(1,student_id);
			st.setString(2,book_id);
			st.setString(3,issue_date);
			st.setNull(4, Types.NULL);
			int result=st.executeUpdate();
	
			//Checks if insert is successful.If yes,then redirects to IssueResult.jsp page 
			if(result>0)
			{
				RequestDispatcher rd = request.getRequestDispatcher("IssueResult.jsp");
				rd.forward(request, response);
			}
 		  }
 		else
 		{
 			System.out.println("student does not exists");
 	 		  return;
 		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}


