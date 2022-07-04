package com.pro.market.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.CboardDao;
import com.pro.market.dto.MemberDto;

public class cboardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		if(member!=null) {
			String cid = request.getParameter("cid");
			String ctitle = request.getParameter("ctitle");
			String ccontent = request.getParameter("ccontent");
			CboardDao cDao = CboardDao.getInstance();
			int result = cDao.writeCboard(cid, ctitle, ccontent);
			if(result == CboardDao.SUCCESS) {
				request.setAttribute("boardResult", "글쓰기 성공");
			}else {
				request.setAttribute("boardResult", "글쓰기 실패");
			}
		}
	}

}
