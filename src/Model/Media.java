package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

//pas utilis� pour l'instant (un attibut dans user"
public class Media {
	
	private String IdMedia;
	private String Name;
	private String Url;
	
	
	public Media(String idMedia, String name, String url) {
		
		this.IdMedia = idMedia;
		this.Name = name;
		this.Url = url;
	}
	
	
	
	public String getIdMedia() {
		return IdMedia;
	}
	public void setIdMedia(String idMedia) {
		IdMedia = idMedia;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		this.Url = url;
	}
	

	//ajout d'une evalaution, simple requte
		public  void AddMediaOfTeam(Media cp,String IdTeam)
		{
			Media media=null;
			try {
				String req = "INSERT INTO media(name, url) VALUES (\""+cp.getName()+"\", \""+cp.getUrl()+"\");";
				System.out.println(req);
				AccesBD.getInstance().executeUpdate(req);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//get media id
			
			ResultSet rs = null ;
			try {
				String req = "SELECT IdMedia,name,url FROM media WHERE name = \""+cp.getName()+"\" ;";  
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			if(rs!= null)
			{
				while(rs.next()){
					media = new Media(String.valueOf(rs.getString("IdMedia")), rs.getString("name"), rs.getString("url"));				
				
					System.out.println( new Media(String.valueOf(rs.getString("IdMedia")), rs.getString("name"), rs.getString("url")).toString());			}
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("id media"+media.getIdMedia());
			try {
				String req = "INSERT INTO team_media(IdTeam,idMedia,type) VALUES (\""+IdTeam+"\",\""+media.getIdMedia()+"\",\"media\");";
				System.out.println(req);
				AccesBD.getInstance().executeUpdate(req);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			//System.out.println("finadd");
		}
		

		public static List<Media> getMediaOfTeam(String IdTeam)
		{
			List<Media> mediaList= new ArrayList<Media>();
			ResultSet rs = null ;
			try {
				String req = "SELECT IdMedia,name,url FROM media WHERE IdMedia IN (SELECT idMedia FROM team_media WHERE IdTeam= \""+IdTeam+"\");  ";
				System.out.println(req);
				rs = AccesBD.getInstance().executeQuery(req);
			
			
			if(rs!= null)
			{
				while(rs.next()){
					mediaList.add( new Media(String.valueOf(rs.getString("IdMedia")), rs.getString("name"), rs.getString("url")));				
				
					System.out.println( new Media(String.valueOf(rs.getString("IdMedia")), rs.getString("name"), rs.getString("url")).toString());			}
			}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return mediaList;

		}	
	
	
	

}
