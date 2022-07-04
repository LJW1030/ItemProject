package com.pro.market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.MessageDao;
import com.pro.market.dto.MessageDto;

public class getPostService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String getId = request.getParameter("mid");
		System.out.println(getId);
		MessageDao mDao = MessageDao.getInstance();
		ArrayList<MessageDto> message = mDao.getPost(getId);
		request.setAttribute("message", message);
	}

}
