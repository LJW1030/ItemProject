package com.pro.market.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.market.dao.CboardDao;
import com.pro.market.dto.AdminDto;
import com.pro.market.dto.CboardDto;
import com.pro.market.dto.MemberDto;

public class cboardListService implements Service {

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
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		AdminDto admin = (AdminDto)session.getAttribute("admin");
		if(member!=null && admin==null) {
			String cid = member.getMid();
			CboardDao cboardDao = CboardDao.getInstance();
			ArrayList<CboardDto> cboardList = cboardDao.getCBoard(cid, startRow, endRow);
			request.setAttribute("cboardList", cboardList);
			int totCnt = cboardDao.getCboardCnt(); // 글갯수
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
		}else if(admin!=null && member==null) {
			CboardDao cboardDao = CboardDao.getInstance();
			ArrayList<CboardDto> cboardList = cboardDao.getadCBoard(startRow, endRow);
			request.setAttribute("cboardList", cboardList);
			int totCnt = cboardDao.getCboardCnt(); // 글갯수
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
		}else {
			request.setAttribute("boardResult", "로그인이 필요한 서비스입니다");
		}
	}

}
