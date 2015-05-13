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
	
	private static final String TEAM_TEAMNAME="TeamName";
	private static final String TEAM_APPOFTEAM="APPOfTheTeam";
	
	private static final String IS_ADMIN="IsAdmin";
	private static final String IS_MODULEMANAGER="IsModuleManager";
	private static final String IS_TUTOR="IsTutor";
	private static final String IS_STUDENT="IsStudent";
	
	
	
	
	public static String getIsAdmin() {
		return IS_ADMIN;
	}
	public static String getIsModulemanager() {
		return IS_MODULEMANAGER;
	}
	public static String getIsTutor() {
		return IS_TUTOR;
	}
	public static String getIsStudent() {
		return IS_STUDENT;
	}
	public static String getTeamTeamname() {
		return TEAM_TEAMNAME;
	}
	public static String getTeamAppofteam() {
		return TEAM_APPOFTEAM;
	}
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
