package Model;

//fourni des constantes de dev, permet de ne pas faire de fautes de frappes
public class StringProvider {

	private static final String NOM = "NOM";
	private static final String PRENOM = "PRENOM";
	private static final String TYPE = "TYPE";
	private static final String NUMBER = "NUMBER";
	private static final String WELCOME = "WELCOME";
	
	private static final String COMP_NAME = "Name"; 
	private static final String COMP_NEEDED = "IsNeeded";
	private static final String COMP_MOTHERCOMP="motherCompetence";
	private static final String COMP_CATEGORY="Category";
	
	private static final String APP_APPType ="APPType";
	private static final String APP_StartDate="StartDate";
	private static final String APP_EndDate="EndDate";
	
	
	
	public static String getCompCategory() {
		return COMP_CATEGORY;
	}
	public static String getAppApptype() {
		return APP_APPType;
	}
	public static String getAppStartdate() {
		return APP_StartDate;
	}
	public static String getAppEnddate() {
		return APP_EndDate;
	}
	public static String getNom() {
		return NOM;
	}
	public static String getPrenom() {
		return PRENOM;
	}
	public static String getType() {
		return TYPE;
	}
	public static String getNumber() {
		return NUMBER;
	}
	public static String getWelcome() {
		return WELCOME;
	}
	public static String getCompName() {
		return COMP_NAME;
	}
	public static String getCompNeeded() {
		return COMP_NEEDED;
	}
	public static String getCompMothercomp() {
		return COMP_MOTHERCOMP;
	}
	
	
	
	

	
	
	
	
	
	
}
