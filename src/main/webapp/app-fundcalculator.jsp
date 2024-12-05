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
                    <h4>Fund Calculator</h4>
                </div>
            </div>
            <div class="col-sm-6 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Fund Options</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Fund Calculator</a></li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-lg-6 col-sm-6">
                        <div class="card" style="width: 200%; height: 300px;">
                            <div class="card-header">
                                <h4 class="card-title">Calculate Your Fund Returns</h4>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label for="investment">Investment Amount &#8377</label>
                                        <input type="number" class="form-control" id="investment" placeholder="Enter investment amount">
                                    </div>
                                    <div class="form-group">
                                        <label for="rate">Rate of Return &#37</label>
                                        <input type="number" class="form-control" id="rate" placeholder="Enter rate of return">
                                    </div>
                                    <div class="form-group">
                                        <label for="years">Investment Duration (Years)</label>
                                        <input type="number" class="form-control" id="years" placeholder="Enter duration in years">
                                    </div>
                                    <button type="button" class="btn btn-primary" onclick="calculateReturns()">Calculate</button>
                                </form>
                                <div id="result" class="mt-3" ></div>
                                <canvas id="growthChart" width="400" height="200" ></canvas>
                                <table id="growthTable" class="table mt-3">
								    <thead>
								        <tr>
								            <th>Year</th>
								            <th>Total Amount &#8377</th>
								            <th>Profit &#8377</th>
								        </tr>
								    </thead>
								    <tbody>
								    </tbody>
								</table>
								                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</div>
<script>
function calculateReturns() {
    const investment = parseFloat(document.getElementById('investment').value);
    const rate = parseFloat(document.getElementById('rate').value);
    const years = parseFloat(document.getElementById('years').value);
    const resultElement = document.getElementById('result');

    if (!isNaN(investment) && !isNaN(rate) && !isNaN(years)) {
        const totalReturns = investment * Math.pow(1 + (rate / 100), years);
        const profit = totalReturns - investment;

        // Suggested years based on a basic condition
        let suggestedYears;
        if (rate >= 8) {
            suggestedYears = "3 to 5 years for optimal returns";
        } else {
            suggestedYears = "2 to 3 years for conservative growth";
        }

        // Display the breakdown in the HTML
        resultElement.innerHTML = 
            '<h5>Total Amount: &#8377;' + totalReturns.toFixed(2) + '</h5>' +
            '<h5>Amount Invested: &#8377;' + investment.toFixed(2) + '</h5>' +
            '<h5>Profit: &#8377;' + profit.toFixed(2) + '</h5>' +
            '<h5>Suggested Investment Duration: ' + suggestedYears + '</h5>';

        resultElement.style.display = 'block';

        // Prepare data for the chart and table
        const labels = [];
        const data = [];
        const tableBody = document.getElementById('growthTable').querySelector('tbody');
        tableBody.innerHTML = ''; // Clear previous data

        labels.push(0); // Year 0
        data.push(investment); // Initial investment amount

        // Add row to the table for initial investment
        tableBody.innerHTML += 
            '<tr>' +
                '<td>0</td>' +
                '<td>&#8377;' + investment.toFixed(2) + '</td>' +
                '<td>&#8377;0.00</td>' +
            '</tr>';

        for (let year = 1; year <= years; year++) {
            labels.push(year);
            const incrementedAmount = investment * Math.pow(1 + (rate / 100), year);
            data.push(incrementedAmount);
            const yearProfit = incrementedAmount - investment;

            // Add row to the table for each year
            tableBody.innerHTML += 
                '<tr>' +
                    '<td>' + year + '</td>' +
                    '<td>&#8377;' + incrementedAmount.toFixed(2) + '</td>' +
                    '<td>&#8377;' + yearProfit.toFixed(2) + '</td>' +
                '</tr>';
        }

        // Create the chart
        const ctx = document.getElementById('growthChart').getContext('2d');
        const growthChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Investment Growth',
                    data: data,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderWidth: 2,
                    fill: true,
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Show the chart and table
        document.getElementById('growthChart').style.display = 'block';
        document.getElementById('growthTable').style.display = 'table'; // Show the table
    } else {
        resultElement.innerHTML = '<h5>Please enter valid values</h5>';
    }
}







</script>
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>
