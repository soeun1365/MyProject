package com.koreait.myproject.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MemberDAO;
import com.koreait.myproject.dto.Member;

public class DoubleEmailCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String email = request.getParameter("emial");
		
		MemberDAO myProjectDAO = sqlSession.getMapper(MemberDAO.class);
		int count = myProjectDAO.doubleEmail(email);
				
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", count);
		return null;
	}

}
