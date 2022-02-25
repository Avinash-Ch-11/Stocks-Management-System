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
public class EAinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EAinfo() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
			//getting input values from jsp page
			String usr = request.getParameter("cusid");

		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
 		int id = 0;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to PostgreSQL database
 		
		PreparedStatement pstmt = con.prepareStatement("select id from login where usr=?");
		pstmt.setString(1,usr);
 		ResultSet rs= pstmt.executeQuery();
		while(rs.next()) {
			id =rs.getInt("id");
		}
 		System.out.println(id);
			PreparedStatement pstm = con.prepareStatement("select * from employee where empid = ?");
 			pstm.setInt(1,id);
 			ResultSet rst= pstm.executeQuery();
 			String firstname = null,lastname = null,address = null,city = null,state = null,position = null;
 			int zipcode = 0,empid = 0;
 			long telephone=0;
 			while(rst.next()) {
 				lastname = rst.getString("lastname");
 				firstname = rst.getString("firstname");
 				address = rst.getString("address");
 				city = rst.getString("city");
 				state = rst.getString("state");
 				zipcode = rst.getInt("zipcode");
 				telephone = rst.getLong("telephone");
 				position = rst.getString("position_");
 				//rating = rst.getInt("rating");
 				empid = rst.getInt("empid");
 			}
 			request.setAttribute("empid", id);
 			request.setAttribute("lastname", lastname);
 			request.setAttribute("firstname", firstname);
 			request.setAttribute("address", address);
 			request.setAttribute("city", city);
 			request.setAttribute("state", state);
 			request.setAttribute("zipcode", zipcode);
 			request.setAttribute("telephone", telephone);
 			request.setAttribute("position", position);
 			//request.setAttribute("rating", rating);
			RequestDispatcher rd = request.getRequestDispatcher("EAinfo.jsp");
			rd.forward(request, response);
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}