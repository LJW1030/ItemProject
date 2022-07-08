package com.pro.market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.MessageDao;
import com.pro.market.dto.AdminDto;
import com.pro.market.dto.MemberDto;
import com.pro.market.dto.MessageDto;

public class getPostService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
		String getId = member.getMid();
		MessageDao mDao = MessageDao.getInstance();
		ArrayList<MessageDto> messages = mDao.getPost(getId);
		request.setAttribute("messages", messages);
		}
	}
}
