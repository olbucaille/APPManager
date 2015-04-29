package BDDManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



/*
 * permet d'acceder à la BDD avec des méthodes bas niveau 
 */
public class AccesBD 
{
	//singleton donc instance privée
	private static AccesBD Instance;
	//elmts de BDD 
	private Connection  con;
	private Statement stm;
	
	private AccesBD() throws ClassNotFoundException, SQLException
	{
		connexion();
		
	}
	
	//à utiliser pour se servir de la classe
	public static AccesBD getInstance() throws ClassNotFoundException, SQLException
	{
		if (Instance == null )
			Instance = new AccesBD();
		return Instance;
	}
	
	//retourne une connexion, c'est ici qu'il faut changer ou l'adresse ou les mdp
	private void connexion() throws ClassNotFoundException, SQLException
    {
        String url = "jdbc:mysql://localhost/BDDGAPP";
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection(url,"root","");            
    }
	
	//à utiliser lorsque l'on veut faire un select
	public ResultSet executeQuery(String requete) throws SQLException
	{
		if(con != null)
		{
			stm = con.createStatement();
			return stm.executeQuery(requete);
		}
		return null;
	}
	//....lorsque l'on veut faire une modif en bdd
	public void executeUpdate(String requete) throws SQLException
	{
		if(con != null)
		{
			stm = con.createStatement();
			 stm.executeUpdate(requete);
		}
	}
	
}
