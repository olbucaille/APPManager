package Model;

public class Media {
	
	private String IdMedia;
	private String Name;
	private String Url;
	
	
	public Media(String idMedia, String name, String url) {
		
		IdMedia = idMedia;
		Name = name;
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
	
	
	

}
