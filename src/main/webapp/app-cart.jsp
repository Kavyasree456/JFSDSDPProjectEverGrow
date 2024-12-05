<%@ page import="com.klef.jfsd.springboot.sdp.service.InvestorServiceImpl" %>
<%@ page import="com.klef.jfsd.springboot.sdp.model.Cart" %>

<%
    Investor investor = null;
    long id = -1; 
    
    if (session == null || (investor = (Investor) session.getAttribute("investor")) == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return; 
    }
    try {
        id = investor.getId();
    } catch (Exception e) {
        session.setAttribute("message", "Unable to retrieve your information. Please login again.");
        response.sendRedirect("investorlogin");
        return;
    }
%>


<%@ include file="app-header.jsp" %>
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Your Favorites</h4>
                    <span class="ml-1">Review your selected funds below.</span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <!-- Iterate through cart items -->
                    <c:forEach var="cartItem" items="${cartItems}">
                        <div class="col-lg-4 col-sm-6">
                            <div class="card mb-4">
                                <div class="card-header text-center">
                                    <%-- <img src="axis.jpg" alt="${cartItem.fundName}" class="img-fluid rounded-circle mb-2" style="width: 80px; height: 80px;"> --%>
                                    <h4 class="card-title">${cartItem.fundName}</h4>
                                </div>
                                <div class="card-body text-center">
                                    <p><strong>Category:</strong> ${cartItem.category}</p>
                                    <p><strong>Net Value Assets:</strong> ${cartItem.nav}%</p>
                                    <form action="/removeFromCart" method="POST" style="display: inline;">
                                        <input type="hidden" name="iid" value="<%= id %>" />
                                        <input type="hidden" name="fid" value="${cartItem.id}" />
                                        <button type="submit" class="btn btn-secondary">Remove from Favorites</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row mt-4">
                    <div class="col-12 text-center">
                        <!-- <a class="btn btn-success" href="checkout" >Proceed to Checkout</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                        <a href="displayFunds">
                            <button class="btn btn-success">Browse Funds</button>
                        </a>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
<script src="./vendor/flot/jquery.flot.js"></script>
<script src="./vendor/flot/jquery.flot.pie.js"></script>
<script src="./vendor/flot/jquery.flot.resize.js"></script>
<script src="./vendor/flot-spline/jquery.flot.spline.min.js"></script>
<script src="./js/plugins-init/flot-init.js"></script>

<script>
    function removeFromCart() {
        alert('Fund removed from cart!');
        // Additional code can be added here to update the cart UI dynamically if required
    }

    
</script>
