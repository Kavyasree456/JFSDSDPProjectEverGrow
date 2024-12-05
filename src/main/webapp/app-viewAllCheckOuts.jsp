<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%@ include file="app-header.jsp" %>
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
        <div class="row">
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

</body>
</html>
