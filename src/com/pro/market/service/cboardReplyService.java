package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.CboardDao;

public class cboardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String cid = request.getParameter("cid");
		String ctitle = request.getParameter("ctitle");
		String ccontent = request.getParameter("ccontent");
		int cref = Integer.parseInt(request.getParameter("cref"));
		int cre_step = Integer.parseInt(request.getParameter("cre_step"));
		int cre_level = Integer.parseInt(request.getParameter("cre_level"));
		CboardDao cDao = CboardDao.getInstance();
		int result = cDao.replyBoard(cid, ctitle, ccontent, cref, cre_step, cre_level);
		if(result == CboardDao.SUCCESS) {
			request.setAttribute("cboardResult", "답변작성 완료");
		}else {
			request.setAttribute("cboardResult", "답변작성 실패");
		}
	}

}
