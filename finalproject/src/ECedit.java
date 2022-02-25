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


/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/LoginServlet")
public class ECedit extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ECedit() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String fn = request.getParameter("fn");
		String ln = request.getParameter("ln");
		String add = request.getParameter("add");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zc = request.getParameter("zc");
		String tp = request.getParameter("tp");
		String id = request.getParameter("id");
		int iid = Integer.parseInt(id);
		String h = request.getParameter("rt");
		int rt = Integer.parseInt(h);
		
		String un = request.getParameter("un");
		String pwd = request.getParameter("pwd");
		System.out.println(fn);
		System.out.println(ln);
		Connection con = null;
 		String url = "jdbc:postgresql://localhost:5432/stocktrading"; //PostgreSQL URL and followed by the database name
 		String username = "manager"; //PostgreSQL username
 		String password = ""; //PostgreSQL password
 		
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to PostgreSQL database
		Statement statement = con.createStatement();
		String update = "update customer set firstname = '" +fn+"', lastname = '"+ln+"', address = '"+add+"', city = '"+city+"',state = '"+state+"', zipcode = '"+zc+"', telephone = '"+tp+"', rating = '"+rt+"' where cusid = "+iid+";";
		String update2 = "update login set  pwd = '"+pwd+"' where id = "+iid+" and acctype = 1;";
		int n=statement.executeUpdate(update);
		int n2=statement.executeUpdate(update2);
		if (n >0 && n2>0) {
			RequestDispatcher rd = request.getRequestDispatcher("ECes.jsp");
			rd.forward(request, response);
		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	
	}


}