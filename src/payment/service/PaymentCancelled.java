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
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import contents.ContentsService;
import gym.GymService;
import gym.basketball.model.BasketballDAO;
import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class PaymentCancelled implements ContentsService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String imp_uid = request.getParameter("imp_uid");
		
		PaymentDTO dto = new PaymentDAO().mydetail(imp_uid);
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("mainUrl", "payment/Cancelled");
	}

}
