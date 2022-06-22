package cert.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cert.CertService;
import cert.model.ShareVar_login;
import member.model.CorpMemberDAO;
import member.model.MemberDAO;

public class CertMailReg implements CertService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String requestPage = request.getParameter("requestPage");
		String memberkind = request.getParameter("memberkind");
		System.out.println("requestPage ===> " + requestPage);// /member/Cert/MailReg
		System.out.println("memberkind ===> " + memberkind);// /member/Cert/MailReg
			
		if(request.getParameter("email")!=null) {
			String inputEmail = request.getParameter("email");
			System.out.println(request.getParameter("email"));
			String dupleCheckMem = new MemberDAO().emailCheck(inputEmail);
			String dupleCheckCorp = new CorpMemberDAO().emailCheck(inputEmail);
			
			request.setAttribute("dupleCheckMem", dupleCheckMem); // dupleCheck 값으로 email 유효성 검사 만들어야 함
			request.setAttribute("dupleCheckCorp", dupleCheckCorp);
			request.setAttribute("email", inputEmail);
			
			if(requestPage.equals("InsertMember") || requestPage.equals("InsertCorpMember")) {
				if(dupleCheckMem.equals("useable") && dupleCheckCorp.equals("useable")) {
					sendMail(inputEmail);
				}
			} else if(requestPage.equals("FindId") || requestPage.equals("FindPw")) {
				if(memberkind.equals("개인회원") && dupleCheckMem.equals("unuseable")) {
					sendMail(inputEmail);
				} else if(memberkind.equals("법인회원") && dupleCheckCorp.equals("unuseable")){
					sendMail(inputEmail);
				}
			}
			
			
		}
		
		if(requestPage.equals("InsertMember")) {
			request.setAttribute("mainUrl", "/member/InsertMember");
		} else if(requestPage.equals("InsertCorpMember")) {
			request.setAttribute("mainUrl", "/member/InsertCorpMember");
		} else if(requestPage.equals("FindId")) {
			request.setAttribute("mainUrl", "/member/FindId");
		} else if(requestPage.equals("FindPw")) {
			request.setAttribute("mainUrl", "/member/FindPw_CertEmail");
		}
		
	}
		
	public String authCodeMaker() {
		String authCode = null;
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		authCode = temp.toString();
		System.out.println(authCode);
		
		return authCode;
	}
	void sendMail(String inputEmail) {
		//인증코드 생성
		String AuthenticationKey = authCodeMaker();
		
		// mail server 설정
		String host = "smtp.gmail.com";
		String user = ShareVar_login.hostID; // 자신의 구글 계정
		String password = ShareVar_login.hostPW;// 자신의 구글 패스워드
		
		// 메일 받을 주소
		String to_email = inputEmail;
		System.out.println("inputedEmail : " + inputEmail);

		// SMTP 서버 정보를 설정한다.
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", host);
		//google - TLS : 587, SSL: 465
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.debug", "true");
        
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		MimeMessage msg = new MimeMessage(session);
		
		// email 전송
		try {
			msg.setFrom(new InternetAddress(user));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

			// 메일 제목
			msg.setSubject("안녕하세요. ReadytoPlay의 인증메일입니다.", "UTF-8");
			// 메일 내용
			msg.setText("인증 번호 :" + AuthenticationKey );

			Transport.send(msg);
			System.out.println("이메일 전송 : " + AuthenticationKey);
			ShareVar_login sv = ShareVar_login.getInstance();
			sv.authEamilCode = AuthenticationKey;

		} catch (AddressException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} catch (MessagingException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); 
		}
	}
}
