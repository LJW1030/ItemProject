package com.pro.market.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.MemberDao;
import com.pro.market.dto.MemberDto;

public class modifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mtel1 = request.getParameter("mtel1");
		String mtel2 = request.getParameter("mtel2");
		String mtel3 = request.getParameter("mtel3");
		String mtel = mtel1+"-"+mtel2+"-"+mtel3;
		String memail = request.getParameter("memail");
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress = request.getParameter("maddress");
		String mgender = request.getParameter("mgender");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, mpw, mname, mtel, memail, maddress, mbirth, mgender, null);
		int result = mDao.modifyMember(member);
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("member", member);
			request.setAttribute("modifyResult", "회원정보 수정 성공");
		}else {
			request.setAttribute("modifyResult", "회원정보 수정 실패");
		}
	}

}
