<%@page import="com.klef.jfsd.springboot.sdp.model.MutualFund"%>
<%@page import="java.util.List"%>
<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }

    List<MutualFund> funds = (List<MutualFund>) session.getAttribute("funds");
    String error=(String)session.getAttribute("message");
    
    session.removeAttribute("message");
%>
<%@ include file="app-header.jsp" %>
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Compare Funds</h4>
                    <span class="ml-1">Choose funds to compare their performance</span>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Fund Options</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Fund Comparer</a></li>
                </ol>
            </div>
        </div>
        
        <!-- Comparison Section -->
        <div class="row">
            <%
                for (MutualFund fund : funds) {
            %>
                <div class="col-lg-6 col-sm-6">
                    <div class="card" style="width: 100%;">
                        <div class="card-header">
                            <h4 class="card-title"><%= fund.getFundName() %></h4>
                        </div>
                        <div class="card-body">
						    <b>Fund Name:</b> <%= fund.getFundName() %> <br>
						    <b>Returns:</b> <%= fund.getExpenseRatio() %> <br>
						    <b>Risk Level:</b> <%= fund.getRiskLevel() %> <br>
						    <div style="float: right;">
						        <form action="addToCompare" method="post">
						            <input type="hidden" name="fundId" value="<%= fund.getId() %>">
						            <button type="submit" class="btn btn-primary">Add to Compare</button>
						        </form>
						    </div>
						</div>
                    </div>
                </div>
            <%
                }
            %>
        </div>

        <!-- Comparison Results Section -->
        <!-- Comparison Results Section -->
		<div class="row mt-4">
		    <div class="col-12">
		        <div class="card">
		            <div class="card-header">
		                <h4 class="card-title">Comparison Result</h4>
		            </div>
		            <div class="card-body">
		                <div class="row">
		                    <%
		                        List<MutualFund> selectedFunds = (List<MutualFund>) session.getAttribute("selectedFunds");
		                        if (selectedFunds != null && selectedFunds.size() == 2) {
		                            MutualFund fund1 = selectedFunds.get(0);
		                            MutualFund fund2 = selectedFunds.get(1);
		                    %>
		                        <div class="col-md-6">
		                            <table class="table">
		                                <thead>
		                                    <tr><th>Attribute</th><th><%= fund1.getFundName() %></th></tr>
		                                </thead>
		                                <tbody>
		                                    <tr><td>Fund Size</td><td><%= fund1.getExpenseRatio() %></td></tr>
		                                    <tr><td>Expense Ratio</td><td><%= fund1.getExpenseRatio() %></td></tr>
		                                    <tr><td>Risk Level</td><td><%= fund1.getRiskLevel() %></td></tr>
		                                </tbody>
		                            </table>
		                        </div>
		                        <div class="col-md-6">
		                            <table class="table">
		                                <thead>
		                                    <tr><th>Attribute</th><th><%= fund2.getFundName() %></th></tr>
		                                </thead>
		                                <tbody>
		                                    <tr><td>Fund Size</td><td><%= fund2.getExpenseRatio() %></td></tr>
		                                    <tr><td>Expense Ratio</td><td><%= fund2.getExpenseRatio() %></td></tr>
		                                    <tr><td>Risk Level</td><td><%= fund2.getRiskLevel() %></td></tr>
		                                </tbody>
		                            </table>
		                        </div>
		                    <%
		                        } else {
		                    %>
		                        <div class="text-center">Please select two funds to compare.</div>
		                    <%
		                        }
		                    %>
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
</body>
</html>