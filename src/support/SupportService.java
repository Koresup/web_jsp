package support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SupportService {
	String NOTICE = "support/notice/";
	String FAQ = "support/faq/";
	String FEEDBACK = "support/feedback/";
	String INFO = "support/info/";
	void execute(HttpServletRequest request, HttpServletResponse response);
}
