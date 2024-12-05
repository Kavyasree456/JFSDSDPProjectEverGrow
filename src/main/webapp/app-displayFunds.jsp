<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }
%>
<%@ include file="app-header.jsp" %>
<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <%-- Loop through the funds passed from the controller --%>
                    <c:forEach items="${funds}" var="fund">
                        <div class="col-12 mb-4">
                            <div class="card" style="width: 100%; height: 230px;">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        <c:out value="${fund.fundName}" />
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <!-- Display the image -->
                                    <img src="<c:out value='${fund.imagePath}' />" alt="Fund Image" style="width: 100px; height: 100px; float: left; margin-right: 15px; object-fit: cover;">

                                    <b>Category: <c:out value="${fund.category}" /></b><br>
                                    <b>NAV: <c:out value="${fund.nav}" />%</b><br>
                                    <b>Expense Ratio: <c:out value="${fund.expenseRatio}" />%</b><br>
                                    <b>Risk Level: <c:out value="${fund.riskLevel}" />%</b><br>
                    
                                    <div class="mt-3" style="float: right;">
                                        <!-- Quick Invest Button with both investor and fund IDs -->
                                        <a class="btn btn-primary" href="checkout?iid=<c:out value='${investor.id}' />&fid=<c:out value='${fund.id}' />&fintrest<c:out value='${fund.id}' />=">Quick Invest</a>
                                        
                                       <form action="/addToCart" method="POST" style="display: inline;">
                                            <input type="hidden" name="iid" value="<c:out value='${investor.id}' />" /> 
                                            <input type="hidden" name="fid" value="<c:out value='${fund.id}' />" />
                                            <button type="submit" class="btn btn-secondary">Add to Cart</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
