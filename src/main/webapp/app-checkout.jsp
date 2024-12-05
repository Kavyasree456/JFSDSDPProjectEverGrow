<%@ page import="com.klef.jfsd.springboot.sdp.model.MutualFund" %>
<%@ page import="com.klef.jfsd.springboot.sdp.model.Investor" %>
<%@ page import="com.klef.jfsd.springboot.sdp.service.InvestorServiceImpl" %>
<%@ page import="java.util.List" %>
<%
    Investor investor = (Investor)session.getAttribute("investor");
    if (investor == null) {
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
                    <h4>Checkout</h4>
                    <span class="ml-1">Review and confirm your investment details</span>
                </div>
            </div>
        </div>

        <!-- Checkout Form Row with Partition -->
        <div class="row">
            <!-- First Form - Fixed Amount and Years (on the left side) -->
            <div class="col-md-5">
            <h3>Lumpsum</h3>
                <form action="processFixedAmountCheckout" method="POST">
                	<div class="form-group">
                		<label for="iid">Investor Id</label>
                		<input readonly="readonly"  class="form-control" name="iid" value="${iid}" />
                	</div>
                	<div class="form-group">
                		<label for="fid">Fund Id</label>
                    	<input readonly="readonly"  class="form-control" name="fid" value="${fid}" />
                    </div>
                    <div class="form-group">
                        <label for="fixedAmount">Fixed Amount (INR)</label>
                        <input type="number" class="form-control" id="fixedAmount" name="fixedAmount" placeholder="Enter the fixed amount" required>
                    </div>
                    <div class="form-group">
                        <label for="years">Years to Invest</label>
                        <input type="number" class="form-control" id="years" name="years" placeholder="Enter number of years" required>
                    </div>
                    <div class="form-group">
                        <label for="interest">Interest</label>
                        <input type="number" readonly="readonly" class="form-control" id="interest" name="interest" value="${ fund.expectedAnnualReturnRate }"  required>
                    </div>
                    <button type="submit" class="btn btn-success">Checkout Fixed Amount</button>
                </form>
            </div>

            <!-- Partition Divider (Vertical) -->
            <div class="col-md-1 d-flex justify-content-center align-items-center">
                <div class="divider"></div>
            </div>

            <!-- Second Form - Monthly Amount, Time, Future Value (on the right side) -->
            
            <div class="col-md-5">
            <h3>Monthly Payment</h3>
            
                <form action="processMonthlyInvestmentCheckout" method="POST">
                	<div class="form-group">
                		<label for="iid">Investor Id</label>
                		<input readonly="readonly"  class="form-control" name="iid" value="${iid}" />
                	</div>
                	<div class="form-group">
                		<label for="fid">Fund Id</label>
                    	<input readonly="readonly"  class="form-control" name="fid" value="${fid}" />
                    </div>
                    <div class="form-group">
                        <label for="monthlyAmount">Monthly Amount (INR)</label>
                        <input type="number" class="form-control" id="monthlyAmount" name="monthlyAmount" placeholder="Enter monthly amount" required onchange="calculateFutureValue()">
                    </div>
                    <div class="form-group">
                        <label for="time">Time Horizon (Years)</label>
                        <input type="number" class="form-control" id="time" name="time" placeholder="Enter time horizon in years" required onchange="calculateFutureValue()">
                    </div>
                    <div class="form-group">
                        <label for="interest">Interest</label>
                        <input type="number" readonly="readonly" class="form-control" id="interest" name="interest" value="${ fund.expectedAnnualReturnRate }"  required>
                    </div>
                    <button type="submit" class="btn btn-success">Checkout Monthly Investment</button>
                </form>
            </div>
        </div>

    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<script>
    function calculateFutureValue() {
        const monthlyAmount = parseFloat(document.getElementById('monthlyAmount').value);
        const time = parseFloat(document.getElementById('time').value);

        if (isNaN(monthlyAmount) || isNaN(time) || monthlyAmount <= 0 || time <= 0) {
            document.getElementById('futureValue').value = '';
            return;
        }

        const annualReturnRate = 0.08;  // 8% annual return rate
        const months = time * 12;
        const futureValue = monthlyAmount * (((Math.pow(1 + annualReturnRate / 12, months) - 1) / (annualReturnRate / 12)) * (1 + annualReturnRate / 12));

        document.getElementById('futureValue').value = futureValue.toFixed(2);
    }
</script>

<style>
    .divider {
        border-left: 1px solid #ddd;
        height: 100%;
        margin: 0 15px;
    }
</style>

</body>
</html>
