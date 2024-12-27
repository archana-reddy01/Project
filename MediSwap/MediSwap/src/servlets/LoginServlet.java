package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AppDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username").trim();

		if(AppDAO.isValidUser(username,request.getParameter("password")))
		{
			request.getSession().setAttribute("username",username);
			response.sendRedirect("viewmedicine.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp?status=Invalid Username and Password");
		}
	}
}
