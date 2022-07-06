package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.BoardDao;
import com.pro.market.dto.MemberDto;

public class boardWriteBService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		if(member!=null) {
			String mid = member.getMid();
			String game = request.getParameter("game");
			String btitle = request.getParameter("btitle");
			int bcost = Integer.parseInt(request.getParameter("bcost"));
			String bcname = request.getParameter("bcname");
			String bcontent = request.getParameter("bcontent");
			BoardDao bDao = BoardDao.getInstance();
			int result = bDao.writeBuy(mid, game, btitle, bcost, bcname, bcontent);
			if(result == BoardDao.SUCCESS) {
				request.setAttribute("boardResult", "글쓰기 성공");
			}else {
				request.setAttribute("boardResult", "글쓰기 실패");
			}
		}else {
			request.setAttribute("boardResult", "로그인이 필요한 서비스입니다");
		}

	}

}
