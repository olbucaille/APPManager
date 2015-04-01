package BDDManager;

public class main {

	public static void main(String[] args) {
		LDAPObject obj= new LDAPObject();
		LDAPaccess acc = new LDAPaccess();
		try {
			obj = acc.LDAPget("olbucaille", "ob8090!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		obj.toString();
	}

}
