package com.pro.market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.MessageDao;
import com.pro.market.dto.MemberDto;
import com.pro.market.dto.MessageDto;

public class sendPostService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			String sendId = member.getMid();
			MessageDao mDao = MessageDao.getInstance();
			ArrayList<MessageDto> messages = mDao.sendPost(sendId);
			request.setAttribute("messages", messages);
		}else {
			System.out.println("로그인이 필요합니다");
		}
	}

}
