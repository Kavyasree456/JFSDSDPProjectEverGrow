<%@page import="com.klef.jfsd.springboot.sdp.model.Investor"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>

<jsp:include page="app-header.jsp"/>

<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please log in to view your checkout details.");
        response.sendRedirect("userlogin");
        return;
    }

    String msg = (String) session.getAttribute("msg");
    session.removeAttribute("msg");
%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>User - View Checkout Details</h4>
                </div>
            </div>
        </div>

        <!-- Single Fund Checkout Details Card -->
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="card border-primary mb-3 shadow">
                    <div class="card-header bg-primary text-white">
                        <%-- <h6 class="card-title mb-0"><% out.print(msg); %></h6>
                        <h4 class="card-title mt-2">Checkout Details</h4> --%>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong>Fund ID:</strong> <span class="text-secondary"><c:out value="${fund.id}"/></span></li>
                            <li class="list-group-item"><strong>Fund Name:</strong> <span class="text-secondary"><c:out value="${fund.fundName}"/></span></li>
                            <li class="list-group-item"><strong>Fund Category:</strong> <span class="text-secondary"><c:out value="${fund.category}"/></span></li>
                            <li class="list-group-item"><strong>Amount (₹):</strong> <span class="text-secondary"><c:out value="${fund.nav}"/></span></li>
                            <li class="list-group-item"><strong>Interest (%):</strong> <span class="text-secondary"><c:out value="${fund.expectedAnnualReturnRate}"/></span></li>
                        </ul>
                        <div class="card-footer text-center">
                        	<a href="viewCheckoutDetails" class="btn btn-secondary">Back to Checkout Details</a>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

</body>
</html>
