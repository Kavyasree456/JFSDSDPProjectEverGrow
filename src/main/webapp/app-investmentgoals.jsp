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
                <div class="row page-titles mx-0">
                    <div class="col-sm-6">
                        <div class="welcome-text">
                            <h4>Investment Goals</h4>
                            <span class="ml-1">Set your long-term financial objectives</span>
                        </div>
                    </div>
                    <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Investments</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Investment Goals</a></li>
                        </ol>
                    </div>
                </div>

                <!-- Investment Goals Section -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Your Investment Goals</h4>
                            </div>
                            <div class="card-body">
                                <form action="#">
                                    <div class="form-group">
                                        <label for="goal">Select Investment Goal</label>
                                        <select class="form-control" id="goal">
                                            <option>Retirement Planning</option>
                                            <option>Child's Education</option>
                                            <option>Buying a House</option>
                                            <option>Travel</option>
                                            <option>Emergency Fund</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="time-horizon">Time Horizon</label>
                                        <input type="number" class="form-control" id="time-horizon" placeholder="Enter years to achieve the goal">
                                    </div>
                                    <div class="form-group">
                                        <label for="investment-amount">Amount Needed (INR)</label>
                                        <input type="number" class="form-control" id="investment-amount" placeholder="Enter the amount required">
                                    </div>
                                    <div class="form-group">
                                        <label for="risk-appetite">Risk Appetite</label>
                                        <select class="form-control" id="risk-appetite">
                                            <option>Low</option>
                                            <option>Moderate</option>
                                            <option>High</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit Goal</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Goals Summary -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Goal Summary</h4>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Goal</th>
                                            <th>Time Horizon (Years)</th>
                                            <th>Amount Needed (INR)</th>
                                            <th>Risk Appetite</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Retirement Planning</td>
                                            <td>25</td>
                                            <td>5,000,000</td>
                                            <td>Moderate</td>
                                            <td><span class="badge badge-success">In Progress</span></td>
                                        </tr>
                                        <tr>
                                            <td>Child's Education</td>
                                            <td>10</td>
                                            <td>1,500,000</td>
                                            <td>High</td>
                                            <td><span class="badge badge-warning">Pending</span></td>
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

    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
</body>
</html>
