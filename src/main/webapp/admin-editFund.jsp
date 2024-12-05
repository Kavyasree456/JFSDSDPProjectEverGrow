<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.sdp.model.MutualFund"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<jsp:include page="admin-header.jsp" />

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        session.setAttribute("message", "Please login to access the Admin Dashboard.");
        response.sendRedirect("adminlogin");
        return; 
    }
%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Edit Fund Details</h4>
                </div>
            </div>
        </div>

        <!-- Edit Fund Form -->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Edit Mutual Fund</h4>
                    </div>
                    <div class="card-body">
                        <form action="admin-updatefund" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${fund.id}" />

                            <div class="form-group">
                                <label>Fund Name</label>
                                <input type="text" class="form-control" name="fundName" value="${fund.fundName}" required />
                            </div>
                            
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" class="form-control" name="category" value="${fund.category}" required />
                            </div>
                            
                            <div class="form-group">
                                <label>NAV (₹)</label>
                                <input type="number" step="0.01" class="form-control" name="nav" value="${fund.nav}" required />
                            </div>
                            
                            <div class="form-group">
                                <label>Expense Ratio (%)</label>
                                <input type="number" step="0.01" class="form-control" name="expenseRatio" value="${fund.expenseRatio}" required />
                            </div>
                            
                            <div class="form-group">
                                <label>Risk Level</label>
                                <select class="form-control" name="riskLevel" required>
                                    <option value="High" <c:if test="${fund.riskLevel == 'High'}">selected</c:if>>High</option>
                                    <option value="Medium" <c:if test="${fund.riskLevel == 'Medium'}">selected</c:if>>Medium</option>
                                    <option value="Low" <c:if test="${fund.riskLevel == 'Low'}">selected</c:if>>Low</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="expectedAnnualReturnRate">Return Rate (%):</label>
                                <input type="number" class="form-control" id="expectedAnnualReturnRate" name="expectedAnnualReturnRate"
                                    step="0.01" placeholder="Enter expected annual return rate" value="${fund.expectedAnnualReturnRate}" required>
                            </div>

                            <div class="form-group">
                                <label>Launch Date</label>
                                <input type="date" class="form-control" name="launchDate" value="${fund.launchDate}" required />
                            </div>

                            <div class="form-group">
                                <label>Fund Image (JPEG or PNG only)</label>
                                <input type="file" class="form-control" name="fundImage" accept="image/jpeg, image/png" />
                                <c:if test="${not empty fund.imagePath}">
                                    <p>Current Image: <img src="${fund.imagePath}" alt="Fund Image" style="width: 100px; height: auto;" /></p>
                                </c:if>
                            </div>

                            <button type="submit" class="btn btn-primary">Update Fund</button>
                            <a href="admin-viewfunds" class="btn btn-secondary">Cancel</a>
                        </form>
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
