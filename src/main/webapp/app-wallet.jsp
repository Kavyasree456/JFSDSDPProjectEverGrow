<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="app-header.jsp" %>

<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please log in to access");
        response.sendRedirect("investorlogin");
        return;
    }
    String msg=(String)session.getAttribute("msg");
	if(msg==null){
		msg="";
	}
	session.removeAttribute("msg");
%>

<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6">
                <div class="welcome-text">
                    <h4>Wallet Management</h4>
                    <span class="ml-1">Manage your wallet transactions below.</span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
            
            
                <div class="wallet-info">
                <h3 style="color: green"><% out.println(msg); %></h3>
                    <h5>Current Balance: ₹<span id="wallet-balance"> <c:out value="${ investor.getCurrentBalance() }"></c:out> </span></h5>
                </div>
                <div class="add-money">
                    <h5>Add Money to Wallet</h5>
                    <form action="addMoney" method="post">
                        <input type="number" name="money" placeholder="Enter Amount" required>
                        <button type="submit" class="btn btn-primary">Add Money</button>
                    </form>
                </div>
                <div class="withdraw-money mt-3">
				    <h5>Withdraw Money</h5>
				    <form action="withdrawMoney" method="post">
				        <input type="number" name="withdrawAmount" placeholder="Enter Amount" required>
				        <button type="submit" class="btn btn-warning">Withdraw</button>
				    </form>
				</div>

                <h4 class="mt-4">Transaction History</h4>
                <div class="transaction-filter mb-3">
                    <select id="transaction-type" onchange="filterTransactions()">
                        <option value="all">All Transactions</option>
                        <option value="deposit">Deposits</option>
                        <option value="withdrawal">Withdrawals</option>
                    </select>
                </div>
                <ul class="transaction-list">
                    <li class="transaction-item positive">
                        <span>Deposit: ₹500</span>
                        <span>2024-10-05</span>
                    </li>
                    <li class="transaction-item negative">
                        <span>Withdrawal: ₹200</span>
                        <span>2024-10-06</span>
                    </li>
                    <li class="transaction-item positive">
                        <span>Deposit: ₹1000</span>
                        <span>2024-10-07</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<script>
    function filterTransactions() {
        const filter = document.getElementById("transaction-type").value;
        const transactions = document.querySelectorAll('.transaction-item');

        transactions.forEach(transaction => {
            if (filter === 'all') {
                transaction.style.display = 'flex';
            } else if (filter === 'deposit' && transaction.classList.contains('positive')) {
                transaction.style.display = 'flex';
            } else if (filter === 'withdrawal' && transaction.classList.contains('negative')) {
                transaction.style.display = 'flex';
            } else {
                transaction.style.display = 'none';
            }
        });
    }
</script>
</body>
</html>
