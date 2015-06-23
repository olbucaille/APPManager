package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

import BDDManager.AccesBD;

public class AutoEvaluation {
	//identifiant de l'evalaution
	private String iD_autoEvaluation;
//identifiant de l'evalaution
private String iD_evaluation;
//nom de l'évalaution (court)
private String id_user;
//ref de l'évalaution
private String idTeam;
//date de l'évalaution
private String date;
//commentaire
private String comment;



//contructeur
public AutoEvaluation(String iD_autoEvaluation,String iD_evaluation, String id_user,String date) {

	this.setiD_autoEvaluation(iD_autoEvaluation);
	this.iD_evaluation=iD_evaluation;
	this.id_user=id_user;	
	this.date=date;
	
}


public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getId_user() {
	return id_user;
}

public void setId_user(String id_user) {
	this.id_user = id_user;
}

public String getID_evaluation() {
	return iD_evaluation;
}

public void setID_evaluation(String iD_evaluation) {
	this.iD_evaluation = iD_evaluation;
}



//ajout d'une evalaution, simple requte
	public static  boolean autoEvaluationIsAlreadyDone(String IdEval ,String idUser )
	{
		ResultSet rs = null ;
		try {
			String req = "SELECT * FROM `auto_evaluation` WHERE id_evaluation = \""+IdEval+"\" and Id_User =\""+idUser+"\"";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
			if(rs!= null)
			{
				
				while(rs.next()){
					return true;						
				}
										
				
			}else
				return false;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;
	}
	

//ajout d'une evalaution, simple requte
	public static  void AddAutoEvaluationMark(String Id_auto_evaluation , String ID_competence,String Mark ,String ID_user_evaluator)
	{
	
		try {
			String req = "INSERT INTO auto_evaluation_mark(Id_auto_evaluation,ID_competence, Mark, ID_user_evaluator) VALUES (\""+Id_auto_evaluation+"\", \""+ID_competence+"\", \""+Mark +"\", \""+ID_user_evaluator+"\")";
			System.out.println(req);
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
//ajout d'une evalaution, simple requte
public static  String AddAutoEvaluation(AutoEvaluation cp)//id de l'évaluation dans la table evaluation
{
	ResultSet rs = null ;
	String IdCrossEval=null;
	try {
		String req = "INSERT INTO auto_evaluation(id_evaluation,id_User, Date) VALUES (\""+cp.getID_evaluation()+"\", \""+cp.getId_user()+"\",  \""+cp.getDate()+"\")";
		System.out.println(req);
		AccesBD.getInstance().executeUpdate(req);
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	try {
		String req = "SELECT LAST_INSERT_ID()";
		System.out.println(req);
		rs = AccesBD.getInstance().executeQuery(req);
			
		if(rs!= null)
		{
			while(rs.next()){
				IdCrossEval = rs.getString("LAST_INSERT_ID()");								
			}
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return "-1";
	}
	return IdCrossEval;
	
	
	
	//System.out.println("finadd");
}




public String getiD_crossEvaluation() {
	return iD_autoEvaluation;
}


public void setiD_autoEvaluation(String iD_autoEvaluation) {
	this.iD_autoEvaluation = iD_autoEvaluation;
}






}
