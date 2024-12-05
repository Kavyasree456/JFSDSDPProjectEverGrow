<%@page import="java.sql.Blob"%>
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
                <div class="col-sm-6 p-md-0">
                    <div class="welcome-text">
                        <h4>Hi, <c:out value="${investor.firstName}" /> <c:out value="${investor.lastName}" />! Welcome back!</h4>
                        <h4> <c:out value="${ errorMessage }"></c:out> </h4>
                        <p class="mb-0">Happy Investment!</p>
                    </div>
                </div>
                <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">App</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Profile</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="profile">
                        <div class="profile-head">
                            <div class="photo-content">
                                <div class="cover-photo"></div>
                                <div class="profile-photo">
								    <%
									    Blob blob= (Blob) investor.getProfileImage();
									    String profileImageUrl;
									
									    if (blob == null || blob.length() == 0) {
									        profileImageUrl = "images/profile/profile.png";
									    } else {
									        profileImageUrl = "displayprofimage";
									    }
									%>

									<img src="<%= profileImageUrl %>" class="img-fluid rounded-circle" alt="Profile Picture">
								    
								    <br>
								</div>
                            </div>
                            <div class="profile-info">
                                <div class="row justify-content-center">
                                    <div class="col-xl-8">
                                        <div class="row">
                                            <div class="col-xl-4 col-sm-4 border-right-1 prf-col">
                                                <div class="profile-name">
                                                <br/><br>
                                                    <h4 class="text-primary"><c:out value="${investor.firstName}" /> <c:out value="${investor.lastName}" /></h4>
                                                    <p>Investor</p>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-sm-4 border-right-1 prf-col">
                                                <div class="profile-email">
                                                    <p>Email</p>
                                                    <h4 class="text-muted"><c:out value="${investor.email}" /></h4>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-sm-4 prf-col">
                                                <div class="profile-phone">
                                                    <p>Phone No.</p>
                                                    <h4 class="text-muted"><c:out value="${investor.phoneNumber}" /></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Profile Information -->
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="profile-news mt-4 pb-3">
                                <h5 class="text-primary d-inline">Mutual Funds Latest News</h5>
                                <div class="media pt-3 pb-3">
                                    <img src="images/profile/5.jpg" alt="image" class="mr-3">
                                    <div class="media-body">
                                        <h5 class="m-b-5">Market Insights</h5>
                                        <p>Experts predict a bullish trend for mutual funds, with several high-performing funds showing increased returns this quarter.</p>
                                    </div>
                                </div>
                                <div class="media pt-3 pb-3">
                                    <img src="images/profile/6.jpg" alt="image" class="mr-3">
                                    <div class="media-body">
                                        <h5 class="m-b-5">Fund Performance</h5>
                                        <p>Top mutual funds for the year have been released, with XYZ Fund outperforming others by a significant margin.</p>
                                    </div>
                                </div>
                                <div class="media pt-3 pb-3">
                                    <img src="images/profile/7.jpg" alt="image" class="mr-3">
                                    <div class="media-body">
                                        <h5 class="m-b-5">Investment Tips</h5>
                                        <p>Financial advisors recommend diversifying your portfolio by investing in both equity and debt mutual funds.</p>
                                    </div>
                                </div>
                            </div>                                
                        </div>
                    </div>
                </div>
                <!-- Settings Tab -->
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="profile-tab">
                                <div class="custom-tab-1">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a href="#about-me" data-toggle="tab" class="nav-link">About Me</a></li>
                                        <li class="nav-item"><a href="#profile-settings" data-toggle="tab" class="nav-link">Settings</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <!-- About Me Tab -->
                                        <div id="about-me" class="tab-pane fade">
                                            <div class="profile-about-me">
                                                <div class="pt-4 border-bottom-1 pb-4">
                                                    <h4 class="text-primary">About Me</h4>
                                                    <p><c:out value="${investor.firstName}" /> <c:out value="${investor.lastName}" /> is an investor from <c:out value="${investor.state}" />, <c:out value="${investor.country}" />.</p>
                                                    <p>Born on <c:out value="${investor.dob}" />, they have been active in mutual fund investments and continuously expanding their portfolio.</p>
                                                </div>
                                            </div>
                                            <div class="profile-personal-info">
                                                <h4 class="text-primary mb-4">Personal Information</h4>
                                                <div class="row mb-4">
                                                    <div class="col-3">
                                                        <h5 class="f-w-500">Name <span class="pull-right">:</span></h5>
                                                    </div>
                                                    <div class="col-9"><span><c:out value="${investor.firstName}" /> <c:out value="${investor.lastName}" /></span></div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-3">
                                                        <h5 class="f-w-500">Email <span class="pull-right">:</span></h5>
                                                    </div>
                                                    <div class="col-9"><span><c:out value="${investor.email}" /></span></div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-3">
                                                        <h5 class="f-w-500">Phone No. <span class="pull-right">:</span></h5>
                                                    </div>
                                                    <div class="col-9"><span><c:out value="${investor.phoneNumber}" /></span></div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-3">
                                                        <h5 class="f-w-500">Date of Birth <span class="pull-right">:</span></h5>
                                                    </div>
                                                    <div class="col-9"><span><c:out value="${investor.dob}" /></span></div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-3">
                                                        <h5 class="f-w-500">Location <span class="pull-right">:</span></h5>
                                                    </div>
                                                    <div class="col-9"><span><c:out value="${investor.state}" />, <c:out value="${investor.country}" /></span></div>
                                                </div>
                                                <div class="row mb-4">
                                                    <div class="col-3">
                                                        <h5 class="f-w-500">Proof Of Identity <span class="pull-right">:</span></h5>
                                                    </div>
                                                    <div class="col-9"><span><c:out value="${investor.proofOfIdentity}" /></span></div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Profile Settings Tab -->
                                        <div id="profile-settings" class="tab-pane fade">
                                            <div class="pt-3">
                                                <div class="settings-form">
                                                    <h4 class="text-primary">Account Setting</h4>
													<form action="updateProfile" method="post" enctype="multipart/form-data">
													    <div class="form-row">
													    	<div class="form-group col-md-6">
													            <label>ID</label>
													            <input type="text" name="id" placeholder="ID" readonly="readonly" class="form-control" value="<c:out value='${investor.id}' />">
													        </div>
													        <div class="form-group col-md-6">
													            <label>First Name</label>
													            <input type="text" name="firstName" placeholder="First Name" class="form-control" value="<c:out value='${investor.firstName}' />">
													        </div>
													        <div class="form-group col-md-6">
													            <label>Last Name</label>
													            <input type="text" name="lastName" placeholder="Last Name" class="form-control" value="<c:out value='${investor.lastName}' />">
													        </div>
													        <div class="form-group col-md-6">
													            <label>Proof of Identity</label>
													            <input readonly="readonly" type="text" name="proofOfIdentity" placeholder="Proof Of Identity" class="form-control" value="<c:out value='${investor.proofOfIdentity}' />">
													        </div>
													    </div>
													    <div class="form-row">
													        <div class="form-group col-md-6">
													            <label>Email</label>
													            <input readonly="readonly" type="email" name="email" placeholder="Email" class="form-control" value="<c:out value='${investor.email}' />">
													        </div>
													    </div>
													    <div class="form-group">
													        <label>Phone Number</label>
													        <input type="text" name="phoneNumber" placeholder="Enter your phoneNumber" class="form-control" value="<c:out value='${investor.phoneNumber}' />">
													    </div>
													    <div class="form-group">
													        <label>State</label>
													        <input type="text" name="state" placeholder="Enter your state" class="form-control" value="<c:out value='${investor.state}' />">
													    </div>
													    <div class="form-group">
													        <label>Country</label>
													        <input type="text" name="country" placeholder="Enter your Country" class="form-control" value="<c:out value='${investor.country}' />">
													    </div>
													    <div class="form-group">
													        <label>DOB</label>
													        <input type="date" name="dob" class="form-control" value="<c:out value='${investor.dob}' />">
													    </div>
													    <div class="form-group">
                                                            <label>Update Profile Picture</label>
                                                            <input type="file" name="profilePicture" class="form-control">
                                                        </div>
													    <div class="form-group">
													        <label>Password</label>
													        <input type="password" name="password" placeholder="Password" class="form-control" value="<c:out value='${investor.password}' />">
													    </div>
													    <button class="btn btn-primary" type="submit">Update</button>
													</form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="copyright">
            <!-- <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p> -->
        </div>
    </div>

<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>