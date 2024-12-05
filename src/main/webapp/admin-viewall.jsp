<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="admin-header.jsp" />
<%
	Admin admin = (Admin) session.getAttribute("admin");
	if (admin == null) {
	    // Set a session attribute for the message
	    session.setAttribute("message", "Please login to access the Admin Dashboard.");
	    response.sendRedirect("adminlogin");
	    return; // Prevent further execution
	}
%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Admin - View Users and Fund Advisors</h4>
                    <h3><c:out value="${msg}"/></h3>
                </div>
            </div>
        </div>

        <!-- Users Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">All Users</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Verification Status</th>
										<th></th>
                                        <th>Action</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="investor" items="${investors}">
                                        <tr>
                                            <td><c:out value="${investor.id}"/></td>
                                            <td><c:out value="${investor.firstName} ${investor.lastName}"/></td>
                                            <td><c:out value="${investor.email}"/></td>
                                            <td><c:out value="${investor.phoneNumber}"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${investor.verified}">
                                                        <span class="badge badge-success">Verified</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-danger">Not Verified</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:if test="${!investor.verified}">
                                                    <a href="admin-verifyuser?id=${investor.id}" class="btn btn-success">Verify</a>
                                                </c:if>
                                            </td>
                                            <td>
												<a href="admin-viewuserdetails?id=${investor.id}" class="btn btn-primary">View Details</a>
                                            </td>
                                            <td>
                                                <a href="admin-deleteuser?id=${investor.id}" class="btn btn-danger">Delete</a>
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

        <!-- Fund Advisors Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">All Fund Advisors</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Specialization</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Alice Brown</td>
                                        <td>alice@example.com</td>
                                        <td>Equity Funds</td>
                                        <td><button class="btn btn-danger">Remove</button></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Bob White</td>
                                        <td>bob@example.com</td>
                                        <td>Debt Funds</td>
                                        <td><button class="btn btn-danger">Remove</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
</body>
</html>
