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
								<h1></h1>
								<h5 class="sub-title-wthree"><%=status%></h5>
						<%
							} else {
						%>
								<h5 class="sub-title-wthree">Login Form</h5>
						<%
							}
						%>
						
                        <form method="get" class="pc-contact" action="LoginServlet">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="contact-name">User Name :
                                        <span>*</span>
                                    </label>
                                    <input type="text" class="form-control" id="contact-name" required name="username">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="contact-email">Password :
                                        <span>*</span>
                                    </label>
                                    <input type="password" class="form-control" id="contact-email" required name="password">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary btn-block w-25" value="Login">
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