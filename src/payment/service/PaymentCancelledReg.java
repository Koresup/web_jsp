package payment.service;

import java.io.IOException;
import java.math.BigDecimal;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentCancelDetail;

import contents.ContentsService;
import gym.GymService;
import gym.basketball.model.BasketballDAO;
import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class PaymentCancelledReg implements ContentsService{
	private IamportClient client;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		this.client = new IamportClient("1906848633633616","55aa1ef5de63241781968a472e4e054658a79c5d8557efab9af8b0d29ffcf6bf896081fcadc46a87");
		String imp_uid = request.getParameter("imp_uid");
		System.out.println(imp_uid);

		String msg = "이미 처리되었거나 유효하지 않은 주문번호입니다.";
		
        CancelData cancel_data = new CancelData(imp_uid, true); //imp_uid를 통한 전액취소

        try {
            IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
            	
            if(payment_response.getResponse()!=null) {
            	
            	System.out.println("cancel_data : "+cancel_data.toString());
            	System.out.println("response : "+payment_response.getResponse().getBuyerName());
            	
            	PaymentDAO dao = new PaymentDAO();
            	PaymentDTO payment = dao.detail(imp_uid);
            	
            	payment.setRefund_reg(true);
            	
            	int res = dao.modify(payment);
            	
            	if(res>0) {
            		msg = "환불 완료";
            		request.setAttribute("data", payment);
            	}
            }
        } catch (IamportResponseException e) {
            System.out.println(e.getMessage());

            switch (e.getHttpStatusCode()) {
                case 401:
                    //TODO
                    break;
                case 500:
                    //TODO
                    break;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        request.setAttribute("msg",msg);
		request.setAttribute("mainUrl", "payment/CancelledReg");
	}
	
}
