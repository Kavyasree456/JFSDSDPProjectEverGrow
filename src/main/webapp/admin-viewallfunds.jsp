<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="admin-header.jsp" />
<%
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin == null) {
	    session.setAttribute("message", "Please login to access the Admin Dashboard.");
	    response.sendRedirect("adminlogin");
	    return; 
	}
	String msg=(String)session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6">
                        <div class="welcome-text">
                            <h4>Admin - View All Funds</h4>
                        </div>
                    </div>
                </div>

                <!-- Funds Table -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                            	<h6 class="card-title"><% out.print(msg); %></h6>
                                <h4 class="card-title">All Mutual Funds</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Fund Name</th>
                                                <th>Category</th>
                                                <th>NAV (₹)</th>
                                                <th>Expense Ratio (%)</th>
                                                <th>Risk Level</th>
                                                <th>Launch Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="fund" items="${funds}">
                                                <tr>
                                                    <td><c:out value="${fund.id}"/></td>
                                                    <td><c:out value="${fund.fundName}"/></td>
                                                    <td><c:out value="${fund.category}"/></td>
                                                    <td><c:out value="${fund.nav}"/></td>
                                                    <td><c:out value="${fund.expenseRatio}"/></td>
                                                    <td><c:out value="${fund.riskLevel}"/></td>
                                                    <td><c:out value="${fund.launchDate}"/></td>
                                                    <td>
                                                        <a href="admin-editfund?id=${fund.id}" class="btn btn-warning">Edit</a>
                                                        <a href="admin-deletefund?id=${fund.id}" class="btn btn-danger">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
		</div>
</div>

</script>
<!-- Scripts -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
