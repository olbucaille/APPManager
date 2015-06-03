package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BDDManager.AccesBD;

public class Category {
	public static List<String> GetAllCategory()
	{
		List<String> categoryList= new ArrayList<String>();
		ResultSet rs = null ;
		try {
			String req = "SELECT ID_category,Name FROM category ; ";
			System.out.println(req);
			rs = AccesBD.getInstance().executeQuery(req);
		
		
		if(rs!= null)
		{
			while(rs.next()){
				categoryList.add( new String(rs.getString("Name")));
			}
		}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryList;

	}


}
