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
import java.sql.Statement;
import java.sql.Statement;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/LoginServlet")
public class MEdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MEdelete() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		
		String usr = request.getParameter("id");
		int inum = Integer.parseInt(usr);
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
 		int id = 0;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); 
		Statement statement = con.createStatement();
		String delete = "delete from employee where empid = "+inum+";";
		String delete2 = "delete from login where id = "+inum+" and acctype = 2;";
		int n=statement.executeUpdate(delete);
		int n2=statement.executeUpdate(delete2);
		if (n >0 && n2>0) {
			RequestDispatcher rd = request.getRequestDispatcher("MEds.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}