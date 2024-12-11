<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Client Management | Invest Mart</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    
    <style>
        body {
            background: #f4f5fa;
        }

        .card {
            background: #fff;
            border: 1px solid #e3e6f0;
            border-radius: 8px;
            margin: 20px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #4e73df;
            color: #fff;
            padding: 10px;
            border-radius: 8px 8px 0 0;
        }

        .card-title {
            font-weight: bold;
        }

        .stat-digit {
            font-size: 1.8rem;
            color: #333;
        }

        .progress {
            height: 7px;
            border-radius: 5px;
        }

        .progress-bar {
            background-color: #1cc88a;
        }

        .table {
            margin-top: 20px;
        }

        .search_bar {
            margin: 20px 0;
        }

        .badge {
            font-size: 0.9rem;
        }

        /* Tooltip styles */
        .tooltip {
            position: relative;
        }

        .tooltip .tooltiptext {
            visibility: hidden;
            width: 120px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px 0;

            /* Position the tooltip */
            position: absolute;
            z-index: 1;
            bottom: 125%; /* Above the text */
            left: 50%;
            margin-left: -60px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .tooltip:hover .tooltiptext {
            visibility: visible;
            opacity: 1;
        }
    </style>
</head>

<body>
    <div id="main-wrapper">
        <!-- Navigation Header -->
        <div class="nav-header">
            <a href="index.jsp" class="brand-logo">
                <h1 class="d-flex align-items-center" style="font-size: 1.5rem; color: white;">EverGrow</h1>
            </a>
        </div>

        <!-- Header Content -->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon p-3 c-pointer" data-toggle="dropdown">
                                    <i class="mdi mdi-magnify"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form>
                                        <input class="form-control" type="search" placeholder="Search Client" aria-label="Search">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="./app-profile.jsp" class="dropdown-item">Profile</a>
                                    <a href="./page-login.jsp" class="dropdown-item">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Main Menu Navigation -->
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Main Menu</li>
                    <li><a href="./fundadvisor-dashboard.jsp"><i class="icon icon-single-04"></i><span class="nav-text">Dashboard</span></a></li>
                    <li class="nav-label">Client Management</li>
                    <li><a href="./client-management.jsp"><i class="icon icon-users"></i><span class="nav-text">Client Management</span></a></li>
                </ul>
            </div>
        </div>

        <!-- Client Management Content Body -->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <!-- Client Statistics -->
                    <div class="col-lg-4 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Total Clients</h4>
                            </div>
                            <div class="card-body">
                                <div class="stat-digit"><%= 350 %></div>
                                <div class="progress mt-3">
                                    <div class="progress-bar" style="width: 70%;" role="progressbar"></div>
                                </div>
                                <p class="mt-2">Total clients onboarded since inception.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Additional Statistics -->
                    <!-- Add dynamic data here -->
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © 2024 Invest Mart. All Rights Reserved.</p>
            </div>
        </div>
    </div>

    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>
</body>

</html>
