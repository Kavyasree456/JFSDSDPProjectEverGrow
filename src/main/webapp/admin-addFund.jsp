<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="admin-header.jsp" />
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("adminlogin");
        return; // Prevent further execution
    }
%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Add Mutual Fund</h4>
                </div>
            </div>
        </div>

        <!-- Add Mutual Fund Form -->
        <div class="row">
            <div class="col-lg-6 col-sm-6">
                <div class="card" style="width: 200%; height: 300px;">
                    <div class="card-header">
                        <c:out value="${msg}" />
                        <h4 class="card-title">Enter Fund Details</h4>
                    </div>
                    <div class="card-body">
                        <!-- Updated form with enctype to support file upload -->
                        <form action="/add-fund" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="fundName">Fund Name:</label>
                                <input type="text" class="form-control" id="fundName" name="fundName" 
                                    placeholder="Enter fund name" required>
                            </div>

                            <div class="form-group">
                                <label for="category">Category:</label>
                                <input type="text" class="form-control" id="category" name="category" 
                                    placeholder="Enter fund category" required>
                            </div>

                            <div class="form-group">
                                <label for="nav">NAV (₹):</label>
                                <input type="number" class="form-control" id="nav" name="nav" 
                                    step="0.01" placeholder="Enter NAV value" required>
                            </div>

                            <div class="form-group">
                                <label for="expenseRatio">Expense Ratio (%):</label>
                                <input type="number" class="form-control" id="expenseRatio" name="expenseRatio" 
                                    step="0.01" placeholder="Enter expense ratio" required>
                            </div>

                            <div class="form-group">
                                <label for="riskLevel">Risk Level:</label>
                                <select class="form-control" id="riskLevel" name="riskLevel" required>
                                    <option value="" disabled selected>Select risk level</option>
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="expectedAnnualReturnRate">Expected Annual Return Rate (%):</label>
                                <input type="number" class="form-control" id="expectedAnnualReturnRate" name="expectedAnnualReturnRate"
                                    step="0.01" placeholder="Enter expected annual return rate" required>
                            </div>

                            <div class="form-group">
                                <label for="launchDate">Launch Date:</label>
                                <input type="date" class="form-control" id="launchDate" name="launchDate" required>
                            </div>

                            <!-- New form group for image upload -->
                            <div class="form-group">
                                <label for="fundImage">Upload Fund Image:</label>
                                <input type="file" class="form-control-file" id="fundImage" name="fundImage" accept=".jpeg, .jpg, .png" required>
                            </div>

                            <button type="submit" class="btn btn-primary">Add Fund</button>
                        </form>

                        <div id="result" class="mt-3">
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
