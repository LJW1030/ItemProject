package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.BoardDao;
import com.pro.market.dao.TradeDao;
import com.pro.market.dto.BoardDto;
import com.pro.market.dto.TradeDto;

public class tradeCompleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String bid = request.getParameter("bid");
		String sid = request.getParameter("sid");
		String btitle = request.getParameter("btitle");
		TradeDao tDao = TradeDao.getInstance();
		int result = tDao.completeTrade(bno, sid, bid);
		if(result==TradeDao.SUCCESS) {
			request.setAttribute("tradeResult", "거래가 완료되었습니다");
			btitle = "(거래완료)"+btitle;
		}else {
			request.setAttribute("tradeResult", "거래 실패");
		}
	}

}
