<%@page import="com.klef.jfsd.springboot.sdp.model.Investor"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Invest Mart</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
</head>
<body>
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>

    <div id="main-wrapper">
        <div class="nav-header">
            <a href="/">
                <h1 class="d-flex align-items-center" style="font-size: 1.5rem; color: white; padding-left: 20%; padding-top: 8%;">EverGrow</h1>
            </a>
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
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
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
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
                                    <a href="investorProfile" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile</span>
                                    </a>
                                    <a href="cart" class="dropdown-item">
                                        <i class="mdi mdi-cart"></i>
                                        <span class="ml-2">Favorites</span>
                                    </a>
                                    <a href="logout" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout</span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Main Menu</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon icon-single-04"></i><span class="nav-text">Dashboard</span></a>
                        <ul aria-expanded="false">
                            <li><a href="dashboard">Dashboard</a></li>
                            <li><a href="viewAllCheckOuts">View Holdings</a></li>
                        </ul>
                    </li>
                    
                    <li class="nav-label">Investment</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon icon-briefcase"></i><span class="nav-text">Fund Options</span></a>
                        <ul aria-expanded="false">
                            <li><a href="displayFunds">Add Fund</a></li>
                            <li><a href="viewAllAPIFunds">Add API Fund</a></li>
                            <li><a href="fundcalculator">Fund Calculator</a></li>
                            <li><a href="fundcomparer">Fund Comparer</a></li>
                            <li><a href="transactionHistory">Transaction History</a></li>
                            <li><a href="investmentGoals">Manage Goals</a></li>
                            <li><a href="investorWallet">Wallet</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Fund Education</li>
                    <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
                        <i class="icon icon-app-store"></i><span class="nav-text">Educational Contents</span></a>
                        <ul aria-expanded="false">
                            <li><a href="app-videos.jsp">Educational Videos</a></li>
                            <li><a href="app-blogs.jsp">Blogs</a></li>
                        </ul>
                        
                        
                    </li>
                </ul>
            </div>
        </div>
      </div>
      
