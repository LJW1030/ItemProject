package com.pro.market.controller;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.service.LoginService;
import com.pro.market.service.MessageReplyService;
import com.pro.market.service.MessageSendingService;
import com.pro.market.service.MessageViewService;
import com.pro.market.service.Service;
import com.pro.market.service.adminLoginService;
import com.pro.market.service.boardContentService;
import com.pro.market.service.boardDeleteService;
import com.pro.market.service.boardListService;
import com.pro.market.service.boardModifyService;
import com.pro.market.service.boardModifyViewService;
import com.pro.market.service.boardWriteBService;
import com.pro.market.service.boardWriteSService;
import com.pro.market.service.buyTradeService;
import com.pro.market.service.cboardContentService;
import com.pro.market.service.cboardDeleteService;
import com.pro.market.service.cboardListService;
import com.pro.market.service.cboardReplyService;
import com.pro.market.service.cboardReplyViewService;
import com.pro.market.service.cboardWriteService;
import com.pro.market.service.emailConfirmService;
import com.pro.market.service.findIdService;
import com.pro.market.service.findPWService;
import com.pro.market.service.getPostService;
import com.pro.market.service.idConfirmService;
import com.pro.market.service.joinService;
import com.pro.market.service.logoutService;
import com.pro.market.service.memberViewService;
import com.pro.market.service.messageDeleteService;
import com.pro.market.service.modifyService;
import com.pro.market.service.sellTradeService;
import com.pro.market.service.sendPostService;
import com.pro.market.service.tradeCompleteService;

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
			service = new memberViewService();
			service.execute(request, response);
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
		}else if(com.equals("/boardModifyView.do")) {
			service = new boardModifyViewService();
			service.execute(request, response);
			viewPage = "board/boardModify.jsp";
		}else if(com.equals("/boardModify.do")) {
			service = new boardModifyService();
			service.execute(request, response);
			viewPage = "boardContent.do";
		}else if(com.equals("/boardDelete.do")) {
			service = new boardDeleteService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/cboardList.do")) {
			service = new cboardListService();
			service.execute(request, response);
			viewPage = "cboard/cboardList.jsp";
		}else if(com.equals("/cboardWriteView.do")) {
			viewPage = "cboard/cboardWrite.jsp";
		}else if(com.equals("/cboardWrite.do")) {
			service = new cboardWriteService();
			service.execute(request, response);
			viewPage = "cboardList.do";
		}else if(com.equals("/cboardContent.do")) {
			service = new cboardContentService();
			service.execute(request, response);
			viewPage = "cboard/cboardContent.jsp";
		}else if(com.equals("/cboardDelete.do")) {
			service = new cboardDeleteService();
			service.execute(request, response);
			viewPage = "cboardList.do";
		}else if(com.equals("/MessageView.do")) {
			service = new MessageViewService();
			service.execute(request, response);
			viewPage = "board/messageSending.jsp";
		}else if(com.equals("/sendMessage.do")) {
			service = new MessageSendingService();
			service.execute(request, response);
			viewPage = "getPost.do";
		}else if(com.equals("/messagePost.do")) {
			service = new getPostService();
			service.execute(request, response);
			viewPage = "message/getPost.jsp";
		}else if(com.equals("/adminLogin.do")) {
			service = new adminLoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(com.equals("/cboardReplyView.do")) {
			service = new cboardReplyViewService();
			service.execute(request, response);
			viewPage = "cboard/cboardReply.jsp";
		}else if(com.equals("/cboardReply.do")) {
			service = new cboardReplyService();
			service.execute(request, response);
			viewPage = "cboardList.do";
		}else if(com.equals("/MessageReply.do")) {
			service = new MessageReplyService();
			service.execute(request, response);
			viewPage = "board/messageReply.jsp";
		}else if(com.equals("/sendPost.do")) {
			service = new sendPostService();
			service.execute(request, response);
			viewPage = "message/sendPost.jsp";
		}else if(com.equals("/getPost.do")) {
			service = new getPostService();
			service.execute(request, response);
			viewPage = "message/getPost.jsp";
		}else if(com.equals("/messageDelete.do")){
			service = new messageDeleteService();
			service.execute(request, response);
			viewPage = "sendPost.do";
		}else if(com.equals("/TradeComplete.do")) {
			service = new tradeCompleteService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(com.equals("/findIdView.do")) {
			viewPage = "member/findId.jsp";
		}else if(com.equals("/findPWView.do")){
			viewPage = "member/findPW.jsp";
		}else if(com.equals("/findId.do")) {
			service = new findIdService();
			service.execute(request, response);
			viewPage = "loginView.do";
		}else if(com.equals("/findPW.do")) {
			service = new findPWService();
			service.execute(request, response);
			viewPage = "loginView.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
