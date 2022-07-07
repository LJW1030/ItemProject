package com.pro.market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.BoardDao;
import com.pro.market.dao.TradeDao;
import com.pro.market.dto.BoardDto;
import com.pro.market.dto.TradeDto;

public class boardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bnoS = request.getParameter("bno");
		int bno;
		if(bnoS==null) {
			bno = (Integer)request.getAttribute("bno");
		}else {
			bno = Integer.parseInt(bnoS);
		}
		BoardDao bDao = BoardDao.getInstance();
		BoardDto board = bDao.getContent(bno);
		TradeDao tDao = TradeDao.getInstance();
		int result = tDao.checkTrade(bno);
		if(result == TradeDao.SUCCESS) {
			request.setAttribute("tradeResult", "거래가 완료된 상품입니다");
		}else {
			request.setAttribute("board", board);
		}
	}

}
