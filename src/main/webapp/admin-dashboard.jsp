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
                    <h4>Admin Dashboard</h4>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Dashboard</a></li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Manage Users</h4>
                    </div>
                    <div class="card-body text-center">
                        <p>View and manage all registered users in the system.</p>
                        <a href="viewAllInvestors" class="btn btn-primary">View Users</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Manage Funds</h4>
                    </div>
                    <div class="card-body text-center">
                        <p>View and manage all registered users in the system.</p>
                        <a href="addFunds" class="btn btn-primary">View Users</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Manage Fund Advisors</h4>
                    </div>
                    <div class="card-body text-center">
                        <p>View and manage all registered fund advisors.</p>
                        <a href="./admin-advisors.html" class="btn btn-primary">View Advisors</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-sm-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Manage Events</h4>
                    </div>
                    <div class="card-body text-center">
                        <p>Create, update, and delete events for users and advisors.</p>
                        <a href="./admin-events.html" class="btn btn-primary">Manage Events</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function calculateReturns() {
        const investment = document.getElementById('investment').value;
        const rate = document.getElementById('rate').value;
        const years = document.getElementById('years').value;

        if (investment && rate && years) {
            const totalReturns = investment * Math.pow(1 + (rate / 100), years);
            document.getElementById('result').innerHTML = 
                `<h5>Total Returns: ₹${totalReturns.toFixed(2)}</h5>`;
        } else {
            document.getElementById('result').innerHTML = '<h5>Please enter valid values</h5>';
        }
    }
</script>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
