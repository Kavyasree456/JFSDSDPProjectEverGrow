<%
	Investor investor=(Investor)session.getAttribute("investor");
	if(investor==null){
	    session.setAttribute("message", "Please login to access");
		response.sendRedirect("investorlogin");
		return;
	}
	
%>
<%@ include file="app-header.jsp" %>
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-tides mx-0">
                    <div class="col-sm-6">
                        <div class="welcome-text">
                            <h4>Transaction History</h4>
                            <span class="ml-1">View your past investment transactions</span>
                        </div>
                    </div>
                    <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Fund Options</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Transaction History</a></li>
                        </ol>
                    </div>
                </div>

                <!-- Transaction History Table -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Recent Transactions</h4>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Transaction Type</th>
                                            <th>Fund Name</th>
                                            <th>Amount (INR)</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2024-09-30</td>
                                            <td>Purchase</td>
                                            <td>Axis Bluechip Direct Fund Growth</td>
                                            <td>50,000</td>
                                            <td><span class="badge badge-success">Completed</span></td>
                                        </tr>
                                        <tr>
                                            <td>2024-08-20</td>
                                            <td>Redemption</td>
                                            <td>ICICI Prudential Technology Fund</td>
                                            <td>30,000</td>
                                            <td><span class="badge badge-warning">Pending</span></td>
                                        </tr>
                                        <tr>
                                            <td>2024-07-15</td>
                                            <td>Purchase</td>
                                            <td>SBI Small Cap Fund</td>
                                            <td>25,000</td>
                                            <td><span class="badge badge-success">Completed</span></td>
                                        </tr>
                                        <!-- Additional transaction rows can go here -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Transaction History Table -->

            </div>
        </div>
    </div>

    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
</body>
</html>
