<%@page import="dao.AppDAO"%>
<%@page import="form.Medicine"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="zxx">

<%@include file="head.jsp"%>

<body>
	<!-- banner -->
	<div class="inner-banner" id="home">
		<!-- header -->
		<%@include file="header.jsp"%>
		<!-- //header -->
		<!-- //container -->
	</div>

	<section class="wthree-row pt-3 pb-lg-5 w3-contact">
		<div class="container py-sm-5 pt-0 pb-5">

			<div class="row contact-form pt-lg-1">
				<!-- //contact details -->
				<div class="col-lg-8 wthree-form-left px-lg-5 mt-lg-0 mt-5">
					<!-- contact form grid -->
					<div class="contact-top1">

						<%
							String status = request.getParameter("status");

							if (status != null) {
						%>
						<h1><%=status%></h1>
						<%
							} else {
						%>
						<h1>List of Medicines</h1><br/><br/>
						<%
							}
						%>

						<table id="customers">

							<tr>
								<th>Medicine</th>
								<th>Side Effects</th>
								<th>Purpose</th>
								<th>Add Substitutes</th>
								<th>View Substitutes</th>
								
								<th>Delete</th>
							</tr>

							<%
								for (Medicine medicine : AppDAO.getMedicines()) {
							%>
									<tr>
										<td><%=medicine.getName()%></td>
										<td><%=medicine.getSideeffects()%></td>
										<td><%=medicine.getPurpose()%></td>

										<td><a href="addsubstitute.jsp?mid=<%=medicine.getId()%>">Add Substitute</a></td>
										<td><a href="viewsubstitutes.jsp?mid=<%=medicine.getId()%>">View Substitute</a></td>
										<td><a href="viewmedicine.jsp?mid=<%=medicine.getId()%>">delete</a></td>
									</tr>
							<%
								}
							%>

						</table>

						<%
							String mid = request.getParameter("mid");

							if (mid != null) {

								if (AppDAO.delteMedicine(Integer.parseInt(mid)) == 1) {
									response.sendRedirect("viewmedicine.jsp?status=success");
								} else {
									response.sendRedirect("viewmedicine.jsp?status=Deleted");
								}
							}
						%>

					</div>
					<!--  //contact form grid ends here -->
				</div>
			</div>
			<!-- //contact details container -->
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>

</html>