package com.koreaIt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormOk
 */
@WebServlet("/FormOk")
public class FormOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // request가 받는 객체 response는 전달하는 객체
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");	// 이 처리를 해주어야 한글이 깨지지 않는다 (jsp에서는 자동으로 입력되어 있다.)
		System.out.println("doGet 호출");
		String data = request.getParameter("data");	// name값과 일치해야 한다.
		PrintWriter out = response.getWriter();
		out.println("<p>데이터 : " + data + "</p>");	// java에서 out은 객체를 생성해야 사용 가능
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");	// 이 처리를 해주어야 한글이 깨지지 않는다 (jsp에서는 자동으로 입력되어 있다.)
		System.out.println("doPost 호출");
		String data = request.getParameter("data");	// name값과 일치해야 한다.
		PrintWriter out = response.getWriter();
		out.println("<p>데이터 : " + data + "</p>");	// java에서 out은 객체를 생성해야 사용 가능
	}
}
