<%@page import="com.klef.jfsd.springboot.sdp.model.Admin"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin View - Users & Fund Advisors</title>
    <link href="./css/style.css" rel="stylesheet">
</head>

<body>
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
                        <h4>Admin Panel</h4>
                    </div>
                    <ul class="navbar-nav header-right">
                        <li class="nav-item dropdown header-profile">
                            <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                <i class="mdi mdi-account"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="admin-profile" class="dropdown-item">
                                    <i class="icon-user"></i> <span class="ml-2">Profile </span>
                                </a>
                                <a href="logout" class="dropdown-item">
                                    <i class="icon-key"></i> <span class="ml-2">Logout </span>
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
                <li><a href="admin-dashboard"><i class="icon icon-single-04"></i> <span class="nav-text">Dashboard</span></a></li>
                <li><a href="javascript:void()" class="has-arrow"><i class="icon icon-app-store"></i> <span class="nav-text">Manage Users</span></a>
                    <ul aria-expanded="false">
                        <li><a href="viewAllInvestors">View All Users</a></li>
                        <li><a href="adminuseractivites">User Activity Logs</a></li>
                        <li><a href="addFunds">Add Funds</a></li>
                        <li><a href="viewAllFunds">View All Funds</a></li>
                    </ul>
                </li>
                <li><a href="adminfeedback"><i class="icon icon-comment"></i> <span class="nav-text">Feedback and Reviews</span></a></li>
            </ul>
        </div>
    </div>
</div>
