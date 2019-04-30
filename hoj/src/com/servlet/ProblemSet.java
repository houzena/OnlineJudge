package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProblemDao;
import com.dao.UserDao;
import com.dao.impl.ProblemDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.domain.Problem;

/**
 * Servlet implementation class ProblemSet
 */
@WebServlet("/ProblemSet")
public class ProblemSet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageid = 1;
		ProblemDao dao = new ProblemDaoImpl();
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");
		if(request.getParameter("pageid")!=null) 
		{	int sum=0;
			for(char c:request.getParameter("pageid").toCharArray())
			{
				sum=sum*10+c-'0';
			}
			pageid = sum;
		}
		try {
			List<Problem> problemList = dao.findPage(pageid);
			request.setAttribute("problemList", problemList);
			
			request.getRequestDispatcher("problemset.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			response.getWriter().println("database error !");
		}
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
