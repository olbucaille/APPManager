package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class Category {
	private String name;
	private String idcategory;
	
	public Category (String name , String idCategory){
		this.name=name;
		this.idcategory=idCategory;
	}
	
	public static List<Category> GetAllCategory()
	{
		List<Category> categoryList= new ArrayList<Category>();
		ResultSet rs = null ;
		try {
			String req = "SELECT ID_category,Name FROM category ; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				categoryList.add( new Category(rs.getString("Name"),rs.getString("ID_category")));
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryList;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdcategory() {
		return idcategory;
	}

	public void setIdcategory(String idcategory) {
		this.idcategory = idcategory;
	}


}
