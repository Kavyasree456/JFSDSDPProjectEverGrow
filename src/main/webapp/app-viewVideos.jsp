<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }
%>
<%@ include file="app-header.jsp" %>
<div class="content-body">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <%-- Loop through the videos passed from the controller --%>
                    <c:forEach items="${videos}" var="video">
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="card video-card" style="width: 100%; height: 280px; position: relative; overflow: hidden; border-radius: 10px;">
                                <div class="video-thumbnail" style="background-image: url('${video.thumbnailUrl}'); background-size: cover; background-position: center; height: 100%; filter: brightness(70%); position: absolute; top: 0; left: 0; right: 0; bottom: 0;"></div>
                                
                                <%-- Gradient Overlay --%>
                                <div class="video-overlay" style="background: linear-gradient(to top, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0)); position: absolute; bottom: 0; left: 0; right: 0; height: 100px;"></div>

                                <%-- Video Content --%>
                                <div class="card-body text-white" style="position: relative; z-index: 2;">
                                    <h4 class="card-title text-truncate">
                                        <c:out value="${video.title}" />
                                    </h4>
                                    <p class="card-text small">
                                        <c:out value="${video.description}" />
                                    </p>
                                    <b>Duration:</b> <c:out value="${video.duration}" /> minutes
                                    
                                    <div class="mt-3 d-flex justify-content-center">
                                        <!-- Play video button -->
                                        <a href="${video.url}" target="_blank" class="btn btn-primary btn-sm" style="background-color: #ff6b6b; border-color: #ff6b6b;">Play Video</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
