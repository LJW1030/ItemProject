package com.pro.market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.TradeDao;
import com.pro.market.dto.MemberDto;
import com.pro.market.dto.TradeDto;

public class sellTradeService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String sid = ((MemberDto)session.getAttribute("member")).getMid();
		TradeDao tDao = TradeDao.getInstance();
		ArrayList<TradeDto> sTrades = tDao.getSellTrade(sid);
		request.setAttribute("sTrades", sTrades);
	}

}
