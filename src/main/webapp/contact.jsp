<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Contact Us - Ever Grow Mutual Fund</title>
  <meta content="Contact page for EverGrow Mutual Fund" name="description">
  <meta content="EverGrow, mutual fund, contact us" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">

  <link href="/css/index.css" rel="stylesheet">

</head>

<body class="page-contact">

  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="/" class="logo d-flex align-items-center">
        <h1 class="d-flex align-items-center">EverGrow</h1>
      </a>

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="contact.jsp" class="active">Contact</a></li>
        </ul>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <!-- ======= Contact Us Section ======= -->
  <section id="contact" class="contact">
    <div class="container">
      <div class="row">
        <div class="col-xl-6">
          <h2 data-aos="fade-up">Get in Touch with Us</h2>
          <p data-aos="fade-up" data-aos-delay="100">
            Have a question or need more information? Feel free to reach out to us by filling out the contact form below. Our team will respond promptly to assist you with your inquiries.
          </p>

          <!-- Contact Form -->
          <form action="submitContact.jsp" method="POST" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="email" name="email" class="form-control" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <input type="text" name="subject" class="form-control" id="subject" placeholder="Subject" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <textarea name="message" class="form-control" id="message" rows="6" placeholder="Your Message" required></textarea>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group text-center">
                  <button type="submit" class="btn-get-started">Send Message</button>
                </div>
              </div>
            </div>
          </form>
        </div>

        <!-- Contact Information -->
        <div class="col-xl-6">
          <h2 data-aos="fade-up">Our Office</h2>
          <div class="contact-info">
            <ul>
              <li><i class="bi bi-geo-alt"></i> 123 Finance Street, Suite 101, City, Country</li>
              <li><i class="bi bi-telephone"></i> +1 (234) 567-8900</li>
              <li><i class="bi bi-envelope"></i> support@evergrow.com</li>
            </ul>
          </div>

          <!-- Google Map Embed -->
          <div class="google-map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3153.2091671096474!2d-122.4219574846816!3d37.77799047975959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8085809d93a6b37d%3A0xd9baf9d7b0f4dbf6!2s123%20Finance%20Street%2C%20San%20Francisco%2C%20CA%2C%2094111!5e0!3m2!1sen!2sus!4v1586999376729!5m2!1sen!2sus" width="100%" height="300" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Contact Us Section -->

  <main id="main"></main>

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <script src="assets/js/main.js"></script>

</body>

</html>
