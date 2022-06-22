package commu_soc.compet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CompetService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
