package Model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class Evaluation {

	public final int NON_ACQUIS =		1;
	public final int INTERMEDIARE =		2;
	public final int ACQUIS =			3;
	public final int AU_DELA =			4;
	
	private List<MarkByCompetencies> markByCompetenciesList;
	
	//on passe en paramètre du constructeur la liste des compétences que l'on veut évaluer
	public Evaluation(List<Competencies> competenciesList){
		for( Competencies comp : competenciesList){			
			MarkByCompetencies competenceWithMark = new MarkByCompetencies();			
			competenceWithMark.setCompetencies(comp);
			this.markByCompetenciesList.add(competenceWithMark);
		}
	}
	
	 
	
	
	
	
/*
	public static  void SaverResult(Competencies cp)
	{
		try {
			String req = "INSERT INTO competencies(Name, Description, Isnecessary, Category,IdMother) VALUES (\""+cp.Name+"\", \""+cp.Desc+"\", \""+cp.Isnecessary+"\",\""+cp.Category+"\", \""+cp.IdMother+"\")";
			System.out.println(req);
			AccesBD.getInstance().executeUpdate(req);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//System.out.println("finadd");
	}*/
}

class MarkByCompetencies{

	private Competencies competencies ;
	private int mark ;
	
	MarkByCompetencies(){
		this.competencies= null;
		this.mark=0;
	}
	
	public Competencies getCompetencies() {
		return competencies;
	}
	public void setCompetencies(Competencies competencies) {
		this.competencies = competencies;
	}
	
	public int getMark(){
		return mark;	
	}
	
	public void setMark(int marck){
		this.mark=mark;	
	}
	
	public String marktoString(){
		return "Compentencies:"+competencies.toString()+"; Mark :"+mark;
	}
	
}
 

