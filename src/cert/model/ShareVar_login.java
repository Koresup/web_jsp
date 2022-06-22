package cert.model;

public class ShareVar_login {
	//VO
	static ShareVar_login instance;
	public static String hostID= "ood1208";
	public static String hostPW = "uxckxhqsnxlyiola";
	public static String authEamilCode = null;
	
	private ShareVar_login() {
		// TODO Auto-generated constructor stub
	}
	
	public static ShareVar_login getInstance() {
		if(instance == null){ //최초 한번만 new 연산자를 통하여 메모리에 할당한다.
			instance = new ShareVar_login();
		}	
		return instance;
	}
	
}
