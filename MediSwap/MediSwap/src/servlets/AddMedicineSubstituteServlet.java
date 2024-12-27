package servlets;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AppDAO;
import form.MedicineSubstitute;


@WebServlet("/AddMedicineSubstituteServlet")
public class AddMedicineSubstituteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MedicineSubstitute medicineSubstitute=new MedicineSubstitute();
		
		medicineSubstitute.setMedicine(Integer.parseInt(request.getParameter("medicine")));
		medicineSubstitute.setSubstitute(Integer.parseInt(request.getParameter("substitute")));
		
		if(AppDAO.addMedicineSubstitute(medicineSubstitute)==1)
		{
			response.sendRedirect("viewmedicine.jsp?status=success");
		}
		else
		{
			response.sendRedirect("viewmedicine.jsp?status=Exist");
		}
	}
}
