package tutorspoin;
import java.sql.*;
public class myConnect {





	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/quanlydiemthi";

	//  Database credentials
	static final String USER = "root";
	static final String PASS = "Minhluan26011998";

	Connection conn = null;
	Statement stmt = null;


	public void KetNoi()
	{

		try{
			//STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			//STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);


			System.out.println("Connected successfully...");
		}catch(SQLException se){
			//Handle errors for JDBC
			se.printStackTrace();
		}catch(Exception e){
			//Handle errors for Class.forName
			e.printStackTrace();
		}
		System.out.println("Goodbye!");
	}

	public ResultSet GetData(String JTable) throws SQLException
	{
		
		ResultSet kq=null;
		Statement st=conn.createStatement();
		String cautruycan="select * from "+JTable+" where status=1";
		kq=st.executeQuery(cautruycan);
		return kq;
	}



	public static void main(String[] args) 
	{

		myConnect c=new myConnect();
		c.KetNoi();
	}

}
