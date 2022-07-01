package com.pro.market.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.service.LoginService;
import com.pro.market.service.Service;
import com.pro.market.service.boardContentService;
import com.pro.market.service.boardListService;
import com.pro.market.service.boardWriteBService;
import com.pro.market.service.boardWriteSService;
import com.pro.market.service.buyTradeService;
import com.pro.market.service.emailConfirmService;
import com.pro.market.service.idConfirmService;
import com.pro.market.service.joinService;
import com.pro.market.service.logoutService;
import com.pro.market.service.modifyService;
import com.pro.market.service.sellTradeService;

@WebServlet("*.do")
public class Pcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Pcontroller() {    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		if(com.equals("/main.do")) {
			viewPage = "main/main.jsp";
		}else if(com.equals("/loginView.do")) {
			viewPage = "member/login.jsp";
		}else if(com.equals("/login.do")) {
			service = new LoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		}else if(com.equals("/join.do")) {
			service = new joinService();
			service.execute(request, response);
			viewPage = "member/login.jsp";
		}else if(com.equals("/idConfirm.do")) {
			service = new idConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		}else if(com.equals("/emailConfirm.do")) {
			service = new emailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
		}else if(com.equals("/memberView.do")) {
			viewPage = "member/memberView.jsp";
		}else if(com.equals("/modifyView.do")) {
			viewPage = "member/modifyView.jsp";
		}else if(com.equals("/modify.do")) {
			service = new modifyService();
			service.execute(request, response);
			viewPage = "member/memberView.jsp";
		}else if(com.equals("/logout.do")) {
			service = new logoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/sellTrade.do")) {
			service = new sellTradeService();
			service.execute(request, response);
			viewPage = "member/sellTrade.jsp";
		}else if(com.equals("/buyTrade.do")) {
			service = new buyTradeService();
			service.execute(request, response);
			viewPage = "member/buyTrade.jsp";
		}else if(com.equals("/boardList.do")) {
			service = new boardListService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
		}else if(com.equals("/boardContent.do")) {
			service = new boardContentService();
			service.execute(request, response);
			viewPage = "board/boardContent.jsp";
		}else if(com.equals("/boardWriteSView.do")) {
			viewPage = "board/boardWriteS.jsp";
		}else if(com.equals("/boardWriteBView.do")) {
			viewPage = "board/boardWriteB.jsp";
		}else if(com.equals("/boardWriteS.do")) {
			service = new boardWriteSService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
		}else if(com.equals("/boardWriteB.do")){
			service = new boardWriteBService();
			service.execute(request, response);
			viewPage = "board/boardList.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
