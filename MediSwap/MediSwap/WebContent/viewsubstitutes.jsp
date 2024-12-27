<%@page import="form.MedicineSubstitute"%>
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
						<h1>Medicine Substitutes</h1> <br/><br/>
						<%
							}
						%>

						<table id="customers">

							<tr>
								<th>Medicine</th>
								<th>Side Effects</th>
								<%
									if(username!=null)
									{
								%>
										<th>Delete</th>
								<%		
									}
								%>
								
							</tr>

							<%
								for (MedicineSubstitute medicineSubstitute : AppDAO.getMedicineSubstitutesByMedicineId(Integer.parseInt(request.getParameter("mid")))) {
									
									Medicine medicine=AppDAO.getMedicineById(medicineSubstitute.getSubstitute());
							%>
									<tr>
										<td><%=medicine.getName()%></td>
										<td><%=medicine.getSideeffects()%></td>
										<%
											if(username!=null)
											{
										%>
												<td><a href="deletesubstitute.jsp?sid=<%=medicineSubstitute.getId()%>">delete substitute</a></td>
										<%		
											}
										%>
									</tr>
							<%
								}
							%>

						</table>
						

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