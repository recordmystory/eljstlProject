package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vo.Person;

/**
 * Servlet implementation class ElServlet
 */
@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ElServlet 실행");
		
		/*
		 * * 데이터들을 담을 수 있는 JSP 내장객체
		 * 1. ServletContext (application Scope)
		 * 	  한 애플리케이션당 단 1개 존재하는 객체
		 * 	  해당 영역에 데이터를 담게 되면 애플리케이션 전역에서 사용가능
		 * 	  공유범위가 가장 큼 (jsp, servlet, java)
		 * 
		 * 2. HttpSession (session Scope)
		 * 	  한 브라우저당 1개씩 존재하는 객체
		 *    해당 영역에 데이터를 담게 되면 jsp, servlet 단에서 사용 가능
		 * 
		 * 3. HttpServletRequest (request Scope)
		 *    요청 때마다 매번 생성되는 객체
		 *    해당 영역에 데이터를 담게 되면 해당 request 객체를 포워딩하는 응답 jsp에서만 사용 가능
		 * 
		 * 4. PageContext (page Scope)
		 *    jsp마다 존재하는 객체
		 *    jsp에서 담고 jsp에서 꺼내 사용 가능
		 *    
		 * 위의 4 객체에 
		 * 데이터를 담을 때는 .setAttribute("키", 담고자하는데이터)
		 * 데이터를 꺼낼 때는 .getAttribute("키") : 담겨있는 데이터(Object 타입) 
		 * 데이터를 삭제할 때는 .removeAttribute("키")
		 */
		
		// requestScope에 담기
		request.setAttribute("classRoom", "A 강의장");
		request.setAttribute("student", new Person("김순자", 22, "여자"));
		
		// sessionScope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("academy", "구디아카데미");
		session.setAttribute("teacher", new Person("김디디", 33, "남자"));
		
		// requestScope와 sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("location", "가디");
		session.setAttribute("location", "구디");
		
		// applicationScope에 담기 => 위와 같이 동일한 키값으로 데이터 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("location", "가산디지털단지역");
		
		request.getRequestDispatcher("/views/01_El/elBasic.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
