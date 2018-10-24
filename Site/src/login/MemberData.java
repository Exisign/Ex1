package login;

import java.util.HashMap;

public class MemberData {

	private int id;
	private int pwd;
	private int name;
	private int email;
	private int address;
	
	MemberData(){
		HashMap user_info = new HashMap();
		user_info.put("ID", id);
		user_info.put("PWD", pwd);
		user_info.put("NAME", name);
		user_info.put("EMAIL", email);
		user_info.put("ADDRESS", address);
	}

}
