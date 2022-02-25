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
public class ECdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ECdelete() {
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
 		String an = "";
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); 
		Statement statement = con.createStatement();
		String sql = "select accnum from account_ where cusid ="+ inum+";";
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			an = resultSet.getString("accnum");
		}
		String port = "delete from portfolio where accnum ="+an+";";
		String order = "delete from order_ where cusaccnum = "+an+"";
		String account = "delete from account_ where cusid = "+inum+";";
		String delete = "delete from customer where cusid = "+inum+";";
		String delete2 = "delete from login where id = "+inum+" and acctype = 1;";
		int n1 = statement.executeUpdate(port);
		int n3 = statement.executeUpdate(order);
		int n4 = statement.executeUpdate(account);
		int n=statement.executeUpdate(delete);
		int n2=statement.executeUpdate(delete2);
		if (n >0 && n2>0 && n1>0 && n3>0 && n4>0) {
			RequestDispatcher rd = request.getRequestDispatcher("ECds.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}