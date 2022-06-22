package contents;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ContentsService {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
}
