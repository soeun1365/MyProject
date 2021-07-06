package com.koreait.myproject.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.myproject.command.member.AccountWithdrawResult;
import com.koreait.myproject.command.member.DoubleEmailCommand;
import com.koreait.myproject.command.member.EmailAuthCommand;
import com.koreait.myproject.command.member.IdCheckCommand;
import com.koreait.myproject.command.member.JoinCommand;
import com.koreait.myproject.command.member.LoginCommand;
import com.koreait.myproject.command.member.LogoutCommand;
import com.koreait.myproject.command.member.ShowIdByEmailCommand;
import com.koreait.myproject.command.member.ShowIdByNamePhone;
import com.koreait.myproject.command.member.UpdatePwCommand;
import com.koreait.myproject.command.member.VerifyEmailCommand;

@org.springframework.stereotype.Controller
public class GallaryController {


	//field
	private static final Logger logger = LoggerFactory.getLogger(GallaryController.class);
	
	private SqlSession sqlSession;
	
	
	//constructor
	@Autowired
	public GallaryController(SqlSession sqlSession
							) {
		super();
		this.sqlSession = sqlSession;
		
	}

	@GetMapping(value= "galaryPage.do")
	public String galaryPage() {
		logger.info("galaryPage()");
		return "board_gallary/gallary";
	}
	
	
}
