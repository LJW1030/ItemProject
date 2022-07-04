package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MessageDao;
import com.pro.market.dto.MessageDto;

public class MessageSendingService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String sendId = request.getParameter("sendId");
		String getId = request.getParameter("getId");
		String etitle = request.getParameter("etitle");
		String econtent = request.getParameter("econtent");
		MessageDao mDao = MessageDao.getInstance();
		int result = mDao.sendMessage(sendId, getId, etitle, econtent);
		if(result==MessageDao.SUCCESS) {
			request.setAttribute("messageResult", "메시지 보내기 완료");
		}else {
			request.setAttribute("messageResult", "메시지 보내기 실패");
		}
	}

}
