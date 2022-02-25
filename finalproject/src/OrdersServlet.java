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
@WebServlet("/PortfolioServlet")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public OrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String usr = request.getParameter("usr");
		int cusid=0,accnum=0,numshares=0,stopprice=0;
		System.out.println("My usrid is "+usr);
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
		String timestamp_ =null,stocksymbol = null,ordertype  = null,pricetype =null;
		Long creditcnum = null;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to PostgreSQL database
 		System.out.println("Printing connection object "+con);
 		PreparedStatement pstmt = con.prepareStatement("select * from login where usr = ?");
 		pstmt.setString(1,usr);
 		ResultSet rs= pstmt.executeQuery();
 		while(rs.next()) {
			cusid=rs.getInt("id");//getting student name and storing in a variable
		}
 		System.out.println("id = "+cusid);

 		PreparedStatement pstm = con.prepareStatement("select * from account_ where cusid = ?");
 		pstm.setInt(1,cusid);
 		ResultSet rs1= pstm.executeQuery();		
 		while(rs1.next()) {
			accnum=rs1.getInt("accnum");
 		}
		PreparedStatement pstm1 = con.prepareStatement("select * from Order_ where cusaccnum = ?");
 		pstm1.setInt(1,accnum);
 		System.out.println("accnum = "+accnum);
 		ResultSet rs11= pstm1.executeQuery();		
 		while(rs11.next()) {
 			timestamp_ =rs11.getString("timestamp_");
 			ordertype  = rs11.getString("ordertype");
 			stocksymbol  = rs11.getString("stocksymbol");
 			numshares =rs11.getInt("numshares");
 			pricetype  = rs11.getString("pricetype");
 			stopprice =rs11.getInt("stopprice");
 		}
 		request.setAttribute("timestamp_", timestamp_);
		request.setAttribute("ordertype", ordertype);
		request.setAttribute("stocksymbol", stocksymbol);
		request.setAttribute("numshares", numshares);
		request.setAttribute("pricetype", pricetype);
		request.setAttribute("stopprice", stopprice);
		RequestDispatcher rd = request.getRequestDispatcher("CusOrders.jsp");
		rd.forward(request, response);
 		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}


