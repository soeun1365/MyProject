package com.koreait.myproject.controller;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.myproject.command.board.InsertGalleryBoardCommand;

@org.springframework.stereotype.Controller
public class GallaryController {


	//field
	private static final Logger logger = LoggerFactory.getLogger(GallaryController.class);
	
	private SqlSession sqlSession;
	private InsertGalleryBoardCommand insertGallaryBoardCommand;
	
	
	//constructor
	@Autowired
	public GallaryController(SqlSession sqlSession,
							 InsertGalleryBoardCommand insertGallaryBoardCommand) {
		super();
		this.sqlSession = sqlSession;
		this.insertGallaryBoardCommand = insertGallaryBoardCommand;
		
	}

	@GetMapping(value= "galaryBoardPage.do")
	public String galaryPage() {
		logger.info("galaryPage()");
		return "gallaryBoard/gallaryBoard";
	}
	
	@GetMapping(value="writeBoardPage.do")
	public String writeBoardPage() {
		logger.info("writeBoardPage()");
		return "gallaryBoard/gallaryWrite";
	}
	
	@PostMapping(value="insertGallaryBoard.do")
	public String insertGallaryBoard(MultipartHttpServletRequest multipartRequest,
									 HttpServletResponse response,
									 Model model) {
		logger.info("insertGallaryBoard()");
		model.addAttribute("multipartRequest", multipartRequest);
		model.addAttribute("response", response);
		insertGallaryBoardCommand.execute(sqlSession, model);
		return "gallaryBoard/gallaryBoard";
	}
}
