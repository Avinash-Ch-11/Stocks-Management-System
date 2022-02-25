import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StocksServlet")
public class StocksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public StocksServlet() {
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
		String stocksymbol = request.getParameter("stocksymbol");
		String s = request.getParameter("accnum");
		int accnum =Integer.parseInt(s);
		int numshares=0;
		float shareprice=0;
		System.out.println("My stocksymbol is "+stocksymbol);
		System.out.println("My accnum is "+accnum);
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
		String stockname =null,ordertype  = null,pricetype =null;
		Long creditcnum = null;
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to PostgreSQL database
 		System.out.println("Printing connection object "+con);
 		PreparedStatement pstmt = con.prepareStatement("select * from stock where stocksymbol = ?");
 		pstmt.setString(1,stocksymbol);
 		ResultSet rs= pstmt.executeQuery();
 		while(rs.next()) {
 			stockname=rs.getString("stockname");
 			shareprice=rs.getFloat("shareprice");
 			numshares=rs.getInt("numavailshares");
		}
 		System.out.println("stockname = "+stockname);
 		System.out.println("shareprice = "+shareprice);
 		System.out.println("numshares = "+numshares);
 		PreparedStatement pstm = con.prepareStatement("DELETE from stock where stocksymbol = ?");
 		pstm.setString(1,stocksymbol);
 		int rs1= pstm.executeUpdate();
 		if(rs1>0)
 		{
	 		System.out.println("numshares = "+numshares);
			PreparedStatement pstm1 = con.prepareStatement("INSERT INTO Portfolio (AccNum, StockSymbol, NumShares, Stop_, StopPrice)" + "VALUES (?, ?, ?, 'None', NULL)");
			pstm1.setInt(1,accnum);
			pstm1.setString(2,stocksymbol);
			pstm1.setInt(3,numshares);
			int result=pstm1.executeUpdate();
			PreparedStatement pstm2 = con.prepareStatement("INSERT INTO order_ (pricetype,ordertype, StockSymbol, NumShares, cusaccnum, timestamp_,  curshareprice, recorded , completed,empid)" + "VALUES ('market',?, ?,?, ?, ?,?,'0','0',1);");
			pstm2.setString(1, "Buy");
			pstm2.setString(2,stocksymbol);
			pstm2.setInt(3,numshares);
			pstm2.setInt(4,accnum);
			pstm2.setTimestamp(5,getCurrentTimeStamp());
			pstm2.setInt(6, numshares);
			int result2=pstm2.executeUpdate();
			if(result>0 && result2>0)
			{
				RequestDispatcher rd = request.getRequestDispatcher("Buy.jsp");
				rd.forward(request, response);
			}
 		}
 		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}


