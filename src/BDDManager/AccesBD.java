package BDDManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class AccesBD 
{
	private static AccesBD Instance;
	private Connection  con;
	private Statement stm;
	private AccesBD() throws ClassNotFoundException, SQLException
	{
		connexion();
		
	}
	public static AccesBD getInstance() throws ClassNotFoundException, SQLException
	{
		if (Instance == null )
			Instance = new AccesBD();
		return Instance;
	}
	
	
	private void connexion() throws ClassNotFoundException, SQLException
    {
        String url = "jdbc:mysql://localhost/BDDGAPP";
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection(url,"root","");            
    }
	
	public ResultSet executeQuery(String requete) throws SQLException
	{
		if(con != null)
		{
			stm = con.createStatement();
			return stm.executeQuery(requete);
		}
		return null;
	}
	
	public void executeUpdate(String requete) throws SQLException
	{
		if(con != null)
		{
			stm = con.createStatement();
			 stm.executeUpdate(requete);
		}
	}
	
}
