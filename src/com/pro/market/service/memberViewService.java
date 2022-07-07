package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.MemberDao;
import com.pro.market.dto.MemberDto;

public class memberViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member!=null) {
			String mid = member.getMid();
			MemberDao mDao = MemberDao.getInstance();
			int result = mDao.upgradeMember(mid);
			if(result == MemberDao.SUCCESS) {
				request.setAttribute("memberResult", "자기정보");
			}else {
				request.setAttribute("memberResult", "자기정보");
			}
				
		}
	}

}
