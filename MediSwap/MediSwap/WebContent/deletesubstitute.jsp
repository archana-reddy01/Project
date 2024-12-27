<%@page import="dao.AppDAO"%>
<%
	String sid = request.getParameter("sid");

	if (sid != null) {

		if (AppDAO.delteMedicineSubstitute(Integer.parseInt(sid)) == 1) {
			response.sendRedirect("viewmedicine.jsp?status=success");
		} else {
			response.sendRedirect("viewmedicine.jsp?status=Deleted");
		}
	}
%>