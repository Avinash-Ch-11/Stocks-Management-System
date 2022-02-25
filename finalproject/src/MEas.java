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
import java.sql.Timestamp;
import java.sql.Statement;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/LoginServlet")
public class MEas extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MEas() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private static java.sql.Timestamp getCurrentTimeStamp() {

        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp(today.getTime());

    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String ssn = request.getParameter("ssn");
		String fn = request.getParameter("fn");
		String ln = request.getParameter("ln");
		String add = request.getParameter("add");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zc = request.getParameter("zc");
		String tp = request.getParameter("tp");
		
		String h = request.getParameter("hr");
		int hr = Integer.parseInt(h);
		String ps = request.getParameter("ps");
		String un = request.getParameter("un");
		String pwd = request.getParameter("pwd");

		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
 		int id = 0;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); 
		Statement statement = con.createStatement();
		//attempting to connect to PostgreSQL database
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO Employee (SSN, LastName, FirstName, Address, City, State, ZipCode, Telephone, startdate, HourlyRate, Position_) VALUES (?,?,?,?,?,?,?,?,?,?,?);");
		pstmt.setString(1,ssn);
		pstmt.setString(2,ln);
		pstmt.setString(3,fn);
		pstmt.setString(4,add);
		pstmt.setString(5,city);
		pstmt.setString(6,state);
		pstmt.setString(7,zc);
		pstmt.setString(8,tp);
		pstmt.setTimestamp(9,getCurrentTimeStamp());
		pstmt.setInt(10,hr);
		pstmt.setString(11,ps);
		PreparedStatement pstmt2 = con.prepareStatement("INSERT INTO Login (Usr, Pwd, AccType) VALUES (?,?,2);");
		pstmt2.setString(1,un);
		pstmt2.setString(2,pwd);
		String enter_string = "select * from Employee where ssn = '" + ssn + "';";
		ResultSet resultSet = statement.executeQuery(enter_string);
		int nnn =0;
		while(resultSet.next()) {
			nnn =1;
		}
		if(nnn != 1) {
			int n2 = pstmt2.executeUpdate();
			int n = pstmt.executeUpdate();
			if (n >0 && n2> 0) {
				RequestDispatcher rd = request.getRequestDispatcher("MEas.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("MEaf.jsp");
				rd.forward(request, response);
			}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("AlreadyAdded.jsp");
			rd.forward(request, response);
		}

		
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}