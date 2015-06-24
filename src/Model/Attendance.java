package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class Attendance {

	



	//permet d'ajouter une session avec les attributs de base 
	public static void addSession(String IdTutor)
	{
		int total = getTotalSession(IdTutor);
		total++;
		String req = "INSERT INTO session_number(IdTutor,SessionTotalNb) VALUES(\""+IdTutor+"\", \""+total+"\")";
		
		try {
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static int getTotalSession(String IdTutor)
	{
		int total=0;
		ResultSet rs = null ;
		try {
			String req = "SELECT max(SessionTotalNb) FROM session_number WHERE IdTutor = \""+IdTutor+"\";  ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				if(rs.getString("max(SessionTotalNb)")!=null)
				total = Integer.parseInt(rs.getString("max(SessionTotalNb)")); 
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;

	}	
}
