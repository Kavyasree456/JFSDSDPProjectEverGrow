<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.sdp.model.ActivityLogs"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="admin-header.jsp" />

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        session.setAttribute("message", "Please login to access the Admin Dashboard.");
        response.sendRedirect("adminlogin");
        return; 
    }
%>

<%@ include file="app-header.jsp" %>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>User Activity Logs</h4>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Admin</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Activity Logs</a></li>
                </ol>
            </div>
        </div>

        <!-- Filter Dropdown for Activity Types -->
        <div class="row mb-3">
            <div class="col-lg-4">
                <label for="activity-filter">Filter by Activity:</label>
                <select id="activity-filter" class="form-control" onchange="filterActivityLogs()">
                    <option value="all">All Activities</option>
                    <option value="Logged In">Logged In</option>
                    <option value="Registered">Registered</option>
                    <option value="Add Money">Add Money</option>
                    <option value="With Draw">With Draw</option>
                </select>
            </div>
        </div>

        <!-- Activity Logs Table -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">User Activity Logs</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Log ID</th>
                                        <th>User ID</th>
                                        <th>User Name</th>
                                        <th>Activity</th>
                                        <th>Timestamp</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="log" items="${activitylogs}">
                                        <tr class="activity-row" data-activity="${log.activity}">
                                            <td>${log.id}</td>
                                            <td>${log.investorId}</td>
                                            <td>${log.investorName}</td>
                                            <td>${log.activity}</td>
                                            <td>${log.timestamp}</td>
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

<!-- Scripts -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<script>
    function filterActivityLogs() {
        const filterValue = document.getElementById("activity-filter").value;
        const rows = document.querySelectorAll(".activity-row");

        rows.forEach(row => {
            const activity = row.getAttribute("data-activity");

            // Check if the activity contains the filter value as a substring
            if (filterValue === "all" || activity.includes(filterValue)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }
</script>
