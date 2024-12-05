<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access.");
        response.sendRedirect("investorlogin");
        return;
    }

    double money = investor.getCurrentBalance();
    String msg = (String) session.getAttribute("msg");
    session.removeAttribute("msg");
%>
<%@ include file="app-header.jsp" %>

<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="card">
                    <div class="stat-widget-two card-body">
                        <div class="stat-content">
                            <div class="stat-text">Total Wallet Money</div>
                            <div class="stat-digit"><i class="fa fa-usd"></i><% out.print(money); %></div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-success w-85" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Checkouts Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h4>All Checkout Funds</h4>

                <c:if test="${not empty checkouts}">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Investor ID</th>
                                <th>Fund ID</th>
                                <th>Amount (INR)</th>
                                <th>Type of Investment</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${checkouts}" var="checkout">
                                <tr>
                                    <td><c:out value="${checkout.userId}" /></td>
                                    <td><c:out value="${checkout.fundId}" /></td>
                                    <td><c:out value="${checkout.amount}" /></td>
                                    <td><c:out value="${checkout.category}" /></td>
                                    <td>
                                        <a href="viewCheckoutDetails?checkoutId=<c:out value='${checkout.fundId}' />" class="btn btn-info btn-sm">View</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty checkouts}">
                    <p>No checkout records found.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
<script src="./vendor/raphael/raphael.min.js"></script>
<script src="./vendor/morris/morris.min.js"></script>
<script src="./vendor/circle-progress/circle-progress.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>
<script src="./vendor/gaugeJS/dist/gauge.min.js"></script>
<script src="./vendor/flot/jquery.flot.js"></script>
<script src="./vendor/flot/jquery.flot.resize.js"></script>
<script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
<script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
<script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>
<script src="./js/dashboard/dashboard-1.js"></script>
</body>
</html>
