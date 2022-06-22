package commu_soc.guest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface GuestService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
