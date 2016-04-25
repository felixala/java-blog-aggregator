<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../layout/taglib.jsp"%>

<spring:url value="/resources/css/demo.css" var="demoCSS"/>
<spring:url value="/resources/css/footer-distributed-with-address-and-phones.css" var="distributedCSS"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="${distributedCSS}" rel="stylesheet" />

<footer class="footer-distributed">

	<div class="footer-left">

		<h3>
			Company<span>logo</span>
		</h3>

		<p class="footer-links">
			<a href="#">Home</a> · <a href="#">Blog</a> · <a href="#">Pricing</a>
			· <a href="#">About</a> · <a href="#">Faq</a> · <a href="#">Contact</a>
		</p>

		<p class="footer-company-name">Felix Laura &copy; 2016</p>
	</div>

	<div class="footer-center">

		<div>
			<i class="fa fa-map-marker"></i>
			<p>
				<span>21 Revolution Street</span> Paris, France
			</p>
		</div>

		<div>
			<i class="fa fa-phone"></i>
			<p>+1 555 123456</p>
		</div>

		<div>
			<i class="fa fa-envelope"></i>
			<p>
				<a href="mailto:support@company.com">support@company.com</a>
			</p>
		</div>

	</div>

	<div class="footer-right">

		<p class="footer-company-about">
			<span>About the company</span> Lorem ipsum dolor sit amet,
			consectateur adispicing elit. Fusce euismod convallis velit, eu
			auctor lacus vehicula sit amet.
		</p>

		<div class="footer-icons">

			<a href="https://www.facebook.com/gatofelixlaura" target='_blank'><i class="fa fa-facebook"></i></a> 
			<a href="https://twitter.com/felixalaura" target='_blank'><i class="fa fa-twitter"></i></a> 
			<a href="hhtps://www.linkedin.com/in/felixala" target='_blank'><i class="fa fa-linkedin"></i></a>
			<a href="https://github.com/felixala" target='_blank'><i class="fa fa-github"></i></a>

		</div>

	</div>

</footer>
