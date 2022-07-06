package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MessageDao;
import com.pro.market.dto.MessageDto;

public class messageDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int eno = Integer.parseInt(request.getParameter("eno"));
		MessageDao mDao = MessageDao.getInstance();
		int result = mDao.deleteMessage(eno);
		if(result == MessageDao.SUCCESS) {
			request.setAttribute("messageResult", "메시지 삭제성공");
		}else {
			request.setAttribute("messageResult", "메시지 삭제실패");
		}
	}

}
