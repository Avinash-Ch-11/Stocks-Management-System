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

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/LoginServlet")
public class ECview extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ECview() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		
		String usr = request.getParameter("custId");
		int inum = Integer.parseInt(usr);
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
 		int id = 0;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to PostgreSQL database
		PreparedStatement pstmt = con.prepareStatement("select * from customer where cusid = ?");
		pstmt.setInt(1,inum);
 		ResultSet rs= pstmt.executeQuery();
 		String firstname = null,lastname = null,address = null,city = null,email = null,state = null,position = null;
			int zipcode = 0,cusid = 0;
			long telephone=0;
			while(rs.next()) {
				lastname = rs.getString("lastname");
				firstname = rs.getString("firstname");
				address = rs.getString("address");
				city = rs.getString("city");
				state = rs.getString("state");
				zipcode = rs.getInt("zipcode");
				telephone = rs.getLong("telephone");
				email = rs.getString("email");
				cusid = rs.getInt("cusid");
			}
			
			request.setAttribute("lastname", lastname);
			request.setAttribute("firstname", firstname);
			request.setAttribute("address", address);
			request.setAttribute("city", city);
			request.setAttribute("state", state);
			request.setAttribute("zipcode", zipcode);
			request.setAttribute("telephone", telephone);
			request.setAttribute("position", position);
			request.setAttribute("email", email);
			request.setAttribute("cusid", cusid);
		RequestDispatcher rd = request.getRequestDispatcher("ECview.jsp");
		rd.forward(request, response);
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}