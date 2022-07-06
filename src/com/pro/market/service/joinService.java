package com.pro.market.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.MemberDao;
import com.pro.market.dto.MemberDto;

public class joinService implements Service {

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
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String maddress = add1+" "+add2;
		String mbirthStr = request.getParameter("mbirth");
		Date mbirth = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String mgender = request.getParameter("mgender");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, mpw, mname, mtel, memail, maddress, mbirth, mgender, null);
		int result = mDao.joinMember(member);
		if(result == MemberDao.SUCCESS) {
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			request.setAttribute("joinResult", "회원가입이 완료되었습니다 로그인 후 이용해주세요");
		}else {
			request.setAttribute("joinResult", "입력하신 정보가 길어서 회원가입이 실패되었습니다");
		}
	}

}
