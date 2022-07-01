package com.pro.market.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pro.market.dao.BoardDao;
import com.pro.market.dto.MemberDto;

public class boardWriteSService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("boardPhoto");
		int maxSize = 1024*1024*10;
		MultipartRequest mRequest = null;
		String bphoto = "";
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bphoto = mRequest.getFilesystemName(param);
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto)session.getAttribute("member");
			if(member!=null) {
				String mid = member.getMid();
				String game = mRequest.getParameter("game");
				String btitle = mRequest.getParameter("btitle");
				int bcost = Integer.parseInt(mRequest.getParameter("bcost"));
				String bcname = mRequest.getParameter("bcname");
				String bcontent = mRequest.getParameter("bcontent");
				BoardDao bDao = BoardDao.getInstance();
				int result = bDao.writeSell(mid, game, btitle, bcost, bcname, bcontent, bphoto);
				if(result == BoardDao.SUCCESS) {
					request.setAttribute("boardResult", "글쓰기 성공");
				}else {
					request.setAttribute("boardResult", "글쓰기 실패");
				}
			}else {
				request.setAttribute("boardResult", "로그인이 필요한 작업입니다");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		if(bphoto != null) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+bphoto);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("F:/webPro/source/1stProject/ItemMarket/WebContent/boardPhoto"+bphoto);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			} 
			
		}
	}

}
