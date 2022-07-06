package com.pro.market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.market.dao.BoardDao;
import com.pro.market.dto.BoardDto;

public class boardListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			if(request.getAttribute("pageNum")==null) { // 글 수정이나 답변글처리시 mRequest를 사용하여서 request에 set함
				pageNum = "1";
			}else {
				pageNum = (String)request.getAttribute("pageNum");
			}
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=10, BLOCKSIZE=10;
		int startRow = (currentPage-1) * PAGESIZE +1;
		int endRow   = startRow + PAGESIZE -1;
		BoardDao bDao = BoardDao.getInstance();
		String game = request.getParameter("game");
		String bbs = request.getParameter("bbs");
		String s = "s";
		String b = "b";
		if(bbs.equals(s)) {
			ArrayList<BoardDto> boardList = bDao.getSellBoard(game, startRow, endRow);
			if(game == null) {
				game = " ";
			}
			request.setAttribute("boardList", boardList);
			int totCnt = bDao.getSellBoardCnt(game); // 글갯수
			int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);//페이지갯수
			int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
			int endPage = startPage + BLOCKSIZE - 1;
			if(endPage>pageCnt) {
				endPage = pageCnt;
			}
			request.setAttribute("BLOCKSIZE", BLOCKSIZE);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("totCnt", totCnt); // totCnt는 없으면 boardList.size()대용
			request.setAttribute("pageNum", currentPage);
		}else if(bbs.equals(b)) {
			ArrayList<BoardDto> boardList = bDao.getBuyBoard(game, startRow, endRow);
			if(game == null) {
				game = " ";
			}
			request.setAttribute("boardList", boardList);
			int totCnt = bDao.getBuyBoardCnt(game); // 글갯수
			int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);//페이지갯수
			int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
			int endPage = startPage + BLOCKSIZE - 1;
			if(endPage>pageCnt) {
				endPage = pageCnt;
			}
			request.setAttribute("BLOCKSIZE", BLOCKSIZE);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("totCnt", totCnt); // totCnt는 없으면 boardList.size()대용
			request.setAttribute("pageNum", currentPage);
		}
		
	}

}
