package Model;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class EvaluationForm implements Serializable{

	public final int NON_ACQUIS =		1;
	public final int INTERMEDIARE =		2;
	public final int ACQUIS =			3;
	public final int AU_DELA =			4;
	
	private static List<MarkByCompetencies> markByCompetenciesList;
	private static List<String> familyComment;
	
	//on passe en paramètre du constructeur la liste des compétences que l'on veut évaluer
	public EvaluationForm(List<Competencies> competenciesList){
		this.markByCompetenciesList= new ArrayList <MarkByCompetencies>();
		for( Competencies comp : competenciesList){			
			MarkByCompetencies competenceWithMark = new MarkByCompetencies();			
			competenceWithMark.setCompetencies(comp);
			this.markByCompetenciesList.add(competenceWithMark);
		}
	}
	
//obtenir la liste des compétences  d'une famille
	public List<Competencies>  getCompetenciesInFamily(String family) {
		// TODO Auto-generated method stub
		List <Competencies> comp_lvl1 = new ArrayList<Competencies>();
		for( MarkByCompetencies comp : markByCompetenciesList){	
			if ((comp.getCompetencies().getIdMother()==null) ||(comp.getCompetencies().getIdMother().equalsIgnoreCase("none"))){
				if (comp.getCompetencies().getCategory().equalsIgnoreCase(family)){					
					comp_lvl1.add(comp.getCompetencies());						
				}
			}
		}		
		return  comp_lvl1;
	}
	
	
//obtenir la liste des compétences  d'une famille
	public List<Competencies>  getCompetenciesInEvaluation() {
		// TODO Auto-generated method stub
		List <Competencies> compList = new ArrayList<Competencies>();
		for( MarkByCompetencies comp : markByCompetenciesList){							
			compList.add(comp.getCompetencies());						
			
		}		
		return  compList;
	}
	
//obtenir la liste des sous compétences d'une compétence 
	public List<Competencies>  getUnderCompetenciesInCompetence(String idMother) {
		// TODO Auto-generated method stub
		List <Competencies> comp_lvl2 = new ArrayList<Competencies>();
		for( MarkByCompetencies comp : markByCompetenciesList){	
			if ((comp.getCompetencies().getIdMother()!=null)||(comp.getCompetencies().getIdMother().equalsIgnoreCase("none")==false)){
				if (comp.getCompetencies().getIdMother().equalsIgnoreCase(idMother)){					
					comp_lvl2.add(comp.getCompetencies());						
				}
			}
		}		
		return  comp_lvl2;
	}
			
			

//obtenir la liste des familles dans la liste des compétences de l'évaluation
	public List<String>  getFamilyListInEvaluation() {
		// TODO Auto-generated method stub
		List <String> famille = new ArrayList<String>();
		for( MarkByCompetencies comp : markByCompetenciesList){	
			
			if (comp.getCompetencies().getCategory().equals("")==false){
				if (famille.contains(comp.getCompetencies().getCategory())==false){
					famille.add(comp.getCompetencies().getCategory());						
				}
			}	
		}
		
		return  famille;
	}
		
//obtenir le nombre de famille dans la liste des compétences de l'évaluation
	public int getNumberOfFamiliesInEvaluation() {
		// TODO Auto-generated method stub
		int i =0;
		List <String> famille = new ArrayList<String>();
		for( MarkByCompetencies comp : markByCompetenciesList){	
			
			if (comp.getCompetencies().getCategory()!=null){
				if (famille.contains(comp.getCompetencies().getCategory())==false){
					famille.add(comp.getCompetencies().getCategory());
					i++;
				}
			}	
		}	
		return i;
	}
	
	
	public void setMarkToCompetencies(String idComp,int value){
		for( MarkByCompetencies comp : markByCompetenciesList){	
			if (comp.getCompetencies().getIdComp().equalsIgnoreCase(idComp)){
				comp.setMark(value);
			}			
		}
	}
	
	
	public int getMarkOfCompetencies(String idComp){
		for( MarkByCompetencies comp : markByCompetenciesList){	
			if (comp.getCompetencies().getIdComp().equalsIgnoreCase(idComp)){
				return comp.getMark();
			}
		}
		return -1;
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

class MarkByCompetencies implements Serializable{

	private Competencies competencies ;
	private int mark ;
	
	MarkByCompetencies(){		
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
 

