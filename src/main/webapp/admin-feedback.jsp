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
                    <h4>User Feedback and Reviews</h4>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Feedback</a></li>
                </ol>
            </div>
        </div>

        <!-- Feedback Form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Submit Feedback</h4>
                    </div>
                    <div class="card-body">
                        <form id="feedback-form">
                            <div class="form-group">
                                <label for="user-id">User ID</label>
                                <input type="text" class="form-control" id="user-id" placeholder="Enter User ID" required>
                            </div>
                            <div class="form-group">
                                <label for="user-name">User Name</label>
                                <input type="text" class="form-control" id="user-name" placeholder="Enter User Name" required>
                            </div>
                            <div class="form-group">
                                <label for="feedback">Feedback</label>
                                <textarea class="form-control" id="feedback" rows="4" placeholder="Write your feedback here..." required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit Feedback</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Feedback and Reviews Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">User Feedback and Reviews</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Feedback ID</th>
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>Feedback</th>
                                        <th>Timestamp</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Sample Row -->
                                    <tr>
                                        <td>1</td>
                                        <td>101</td>
                                        <td>John Doe</td>
                                        <td>Great service! Really enjoyed my experience.</td>
                                        <td>2024-10-01 12:00:00</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>102</td>
                                        <td>Jane Smith</td>
                                        <td>Could use some improvements, but overall good.</td>
                                        <td>2024-10-01 12:15:00</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>103</td>
                                        <td>Michael Brown</td>
                                        <td>Had a wonderful time! Will recommend.</td>
                                        <td>2024-10-01 12:30:00</td>
                                    </tr>
                                    <!-- Add more rows as needed -->
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
