package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AppDAO;
import form.Medicine;


@WebServlet("/AddMedicineServlet")
public class AddMedicineServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Medicine medicine=new Medicine();
		
		medicine.setName(request.getParameter("name"));
		medicine.setSideeffects(request.getParameter("sideeffects"));
		medicine.setPurpose(request.getParameter("purpose")); 
		
		if(AppDAO.addMedicine(medicine)==1)
		{
			response.sendRedirect("addmedicine.jsp?status=Medicine Added");
		}
		else
		{
			response.sendRedirect("addmedicine.jsp?status=Exist");
		}
	}
}
