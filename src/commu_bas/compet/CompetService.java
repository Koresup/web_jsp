package commu_bas.compet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CompetService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
