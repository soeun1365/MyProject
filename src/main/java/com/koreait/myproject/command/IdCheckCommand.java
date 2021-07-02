package com.koreait.myproject.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MyProjectDAO;

public class IdCheckCommand {

	public Map<String, Integer> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		MyProjectDAO myProjectDAO = sqlSession.getMapper(MyProjectDAO.class);
		
		int count = myProjectDAO.idCheck(id);
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		
		resultMap.put("count", count);
		
		return resultMap;

	}

}
