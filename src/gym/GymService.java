package gym;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GymService {
	String BASKETBALL = "gym/basketball/";
	String SOCCER = "gym/soccer/";
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
