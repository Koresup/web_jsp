package cert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CertService {
		void execute(HttpServletRequest request, HttpServletResponse response);
}
