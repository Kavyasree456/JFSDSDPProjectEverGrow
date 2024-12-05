<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("http://localhost:2024/investorlogin");
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
                                    </h4>
                                </div>
                                <div class="card-body">

                                    <b>Fund Code: <c:out value="${ fund.schemeCode }"></c:out> </b>
                                    <b>Schema Name: <c:out value="${fund.schemeName}" />%</b><br>
                    
                                    <div class="mt-3" style="float: right;">
                                        <%-- <a class="btn btn-primary" href="checkout?iid=<c:out value='${investor.id}' />&fid=<c:out value='${fund.id}' />">Quick Invest</a>
                                        
                                       <form action="/addToCart" method="POST" style="display: inline;">
                                            <input type="hidden" name="iid" value="<c:out value='${investor.id}' />" /> 
                                            <input type="hidden" name="fid" value="<c:out value='${fund.id}' />" />
                                            <button type="submit" class="btn btn-secondary">Add to Cart</button>
                                        </form> --%>
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
