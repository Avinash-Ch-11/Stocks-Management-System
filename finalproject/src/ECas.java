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
public class ECas extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ECas() {
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
	
		
		String fn = request.getParameter("fn");
		String ln = request.getParameter("ln");
		String add = request.getParameter("add");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zc = request.getParameter("zc");
		String tp = request.getParameter("tp");
		
		String h = request.getParameter("rt");
		int rt = Integer.parseInt(h);
		String em = request.getParameter("em");
		String un = request.getParameter("un");
		String pwd = request.getParameter("pwd");
		String cd = request.getParameter("cd");
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
 		int id = 0;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); 
		Statement statement = con.createStatement();
		//attempting to connect to PostgreSQL database
		
		ResultSet resultSet = null;
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO Customer ( LastName, FirstName, Address, City, State, ZipCode, Telephone, email, rating) VALUES (?,?,?,?,?,?,?,?,?);");
		pstmt.setString(1,ln);
		pstmt.setString(2,fn);
		pstmt.setString(3,add);
		pstmt.setString(4,city);
		pstmt.setString(5,state);
		pstmt.setString(6,zc);
		pstmt.setString(7,tp);
		pstmt.setInt(9,rt);
		pstmt.setString(8,em);
		int n = pstmt.executeUpdate();
		int sqll = 0;
		String sql ="select cusid from customer where email ='"+em+"';";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			sqll = resultSet.getInt("cusid");
		}
		PreparedStatement pstmt2 = con.prepareStatement("INSERT INTO Login (Usr, Pwd, AccType) VALUES (?,?,1);");
		pstmt2.setString(1,un);
		pstmt2.setString(2,pwd);
		PreparedStatement pstmt3 = con.prepareStatement("INSERT INTO account_ (cusid, CreditCNum, AccCreDate) VALUES (?,?,?);");
		pstmt3.setInt(1, sqll);
		pstmt3.setString(2, cd);
		pstmt3.setTimestamp(3,getCurrentTimeStamp());
		int n2 = pstmt2.executeUpdate();
		int n3 = pstmt3.executeUpdate();
		if (n >0 && n2> 0 && n3>0) {
			RequestDispatcher rd = request.getRequestDispatcher("ECas.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("ECaf.jsp");
			rd.forward(request, response);
		}
		
		

		
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}