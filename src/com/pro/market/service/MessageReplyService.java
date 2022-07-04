package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MessageDao;
import com.pro.market.dto.MessageDto;

public class MessageReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String getId = request.getParameter("sendId");
		request.setAttribute("getId", getId);
	}

}
