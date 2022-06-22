package gym.soccer.service;

import java.io.IOException;
import java.math.BigDecimal;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class SoccerReservationReg implements GymService{
	private IamportClient client;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요한 서비스 입니다.");
			request.setAttribute("mainUrl", "alert");
			request.setAttribute("goUrl", "member/Login");
		}else {
		
			this.client = new IamportClient("1906848633633616","55aa1ef5de63241781968a472e4e054658a79c5d8557efab9af8b0d29ffcf6bf896081fcadc46a87");
			String uid = request.getParameter("imp_uid");
			
			try {
				IamportResponse<Payment> paymentResponse = client.paymentByImpUid(uid);
				
				// 검증
				assertNotNull(paymentResponse.getResponse());
	            assertEquals(uid, paymentResponse.getResponse().getImpUid());
	            
	            // 결제 금액과 비교
	            if(paymentResponse.getResponse().getAmount().compareTo(BigDecimal.valueOf(100)) == 0) {
	    			System.out.println("검증통과");
	    			
	    			PaymentDTO paymentDTO = new PaymentDTO();
	    			
	    			paymentDTO.setImp_uid(paymentResponse.getResponse().getImpUid());
	    			paymentDTO.setAmount(paymentResponse.getResponse().getAmount().toString());
	    			paymentDTO.setBuyer_name(paymentResponse.getResponse().getBuyerName());
	    			paymentDTO.setMerchant_uid(paymentResponse.getResponse().getMerchantUid());
	    			paymentDTO.setId(request.getParameter("id"));
	    			paymentDTO.setSname(request.getParameter("sname"));
	    			paymentDTO.setResDate(request.getParameter("dateSet"));
	    			paymentDTO.setResTime(request.getParameter("selectTime"));
	    			paymentDTO.setUser_id(request.getParameter("user_id"));
	    			paymentDTO.setManager_id(request.getParameter("manager_id"));
	    			
	    			System.out.println("imp_uid: "+paymentResponse.getResponse().getImpUid());
	    			System.out.println("Amount: "+paymentResponse.getResponse().getAmount());
	    			System.out.println("getBuyerName: "+paymentResponse.getResponse().getBuyerName());
	    			System.out.println("getMerchantUid: "+paymentResponse.getResponse().getMerchantUid());
	    			System.out.println("id: "+request.getParameter("id"));
	    			System.out.println("경기장 : "+request.getParameter("sname"));
	    			System.out.println("날짜 : "+request.getParameter("dateSet"));
	    			System.out.println("시간 : "+request.getParameter("selectTime"));
	    			System.out.println("user : "+request.getParameter("user_id"));
	    			System.out.println("manager_id : "+request.getParameter("manager_id"));
	    			
	    			new PaymentDAO().insert(paymentDTO);
	    			
	    			request.setAttribute("paymentResult", paymentDTO);
	    		}
	            System.out.println(paymentResponse.getResponse());
				//TODO : 처리 로직
			} catch (IamportResponseException e) {
				System.out.println(e.getMessage());
				
				switch(e.getHttpStatusCode()) {
				case 401 :
					//TODO : 401 Unauthorized 
					break;
				case 404 :
					//TODO : imp_123412341234 에 해당되는 거래내역이 존재하지 않음
				 	break;
				case 500 :
					//TODO : 서버 응답 오류
					break;
				}
			} catch (IOException e) {
				//서버 연결 실패
				e.printStackTrace();
			}
			
			request.setAttribute("mainUrl", SOCCER+"ReservationReg");
		}
	}
}
