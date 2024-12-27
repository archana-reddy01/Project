<%@page import="dao.AppDAO"%>
<%@page import="form.Medicine"%>
<%@page import="java.util.Date"%>
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
                    	
                    	<!-- insert the page content here -->
						<%
							String status = request.getParameter("status");
			
							if (status != null) {
						%>
							<h5 class="sub-title-wthree"><%=status%></h5>
						<%
							} else {
						%>
								<h5 class="sub-title-wthree">Add Substitute</h5>
						<%
							}
						%>
						
                        <form action="AddMedicineSubstituteServlet" method="post" name="appform">
                        
                        	<input type="hidden"  name="medicine" value="<%=request.getParameter("mid")%>">
                        	
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="contact-name">Select Substitute:
                                        <span>*</span>
                                    </label>
                                    <select class="form-control" id="contact-name" required name="substitute">
                                    	<option value="">--select--</option>
                                    	<%
											for (Medicine medicine : AppDAO.getMedicines()) {
										%>
												<option value="<%=medicine.getId()%>"><%=medicine.getName()%></option>
										<%
											}
										%>
                                    </select>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary btn-block w-25" value="Add Sustitute">
                        </form>
                        
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