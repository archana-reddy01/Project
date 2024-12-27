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
                                <h5 class="sub-title-wthree">Add Medicine</h5>
                        <%
                            }
                        %>
                        
                        <form action="AddMedicineServlet" method="post" name="appform">
                        
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label for="contact-name">Medicine Name:
                                        <span>*</span>
                                    </label>
                                    <input class="form-control" id="contact-name" required type="text"  name="name">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label for="contact-sideeffects">Side effects:
                                        <span>*</span>
                                    </label>
                                    <textarea class="form-control" id="contact-sideeffects" required name="sideeffects"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 form-group">
                                    <label for="purpose">Purpose:
                                        <span>*</span>
                                    </label>
                                    <input class="form-control" id="purpose" required type="text" name="purpose">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary btn-block w-25" value="Add Medicine">
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
