package com.koreait.myproject.command.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.myproject.dao.GalleryBoardDAO;
import com.koreait.myproject.dto.GalleryBoard;

public class InsertGalleryBoardCommand implements BoardCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String id = multipartRequest.getParameter("id");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		String filename = multipartRequest.getParameter("filename");
		String ip = multipartRequest.getRemoteAddr();
				
		GalleryBoard galleryBoard = new GalleryBoard();
		galleryBoard.setId(id);
		galleryBoard.setTitle(title);
		galleryBoard.setContent(content);
		galleryBoard.setFilename(filename);
		galleryBoard.setIp(ip);
		
		System.out.println(galleryBoard);
		
		GalleryBoardDAO galleryBoardDAO = sqlSession.getMapper(GalleryBoardDAO.class);
		int count = galleryBoardDAO.insertGalleryBoard(galleryBoard);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", count);
		try {
			if(count > 0) {
				response.getWriter().println("<script>");
				response.getWriter().println("alert('등록되었습니다.')");
				response.getWriter().println("</script>");
			}else if(count == 0) {
				response.getWriter().println("<script>");
				response.getWriter().println("alert('등록에 실패하였습니다.')");
				response.getWriter().println("</script>");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

}
