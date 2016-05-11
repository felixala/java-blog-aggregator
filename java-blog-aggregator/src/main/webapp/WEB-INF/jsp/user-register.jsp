<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<style>
    .error {
        color: red; font-weight: bold;
    }
</style>

<form:form commandName="user" cssClass="form-horizontal registrationForm">

	<c:if test="${param.success eq true}">
		<div class="alert alert-success">Registration Success...</div>
	</c:if>

	<div class="form-group">
		<label for="name" class="col-sm-2 control-label">Name:</label>
		<div class="col-sm-10">
			<form:input path="name" cssClass="form-control" placeholder="Name"/>
			<form:errors path="name" cssClass="error"/>
		</div>
	</div>

	<div class="form-group">
		<label for="email" class="col-sm-2 control-label">Email:</label>
		<div class="col-sm-10">
			<div class="input-group">
			<span class="input-group-addon">@</span>
			<form:input path="email" cssClass="form-control" placeholder="Email"/>
			<form:errors path="email" cssClass="error" />
		</div>
		</div>
	</div>

	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Password:</label>
		<div class="col-sm-10">
			<form:password path="password" cssClass="form-control" placeholder="Password (At least 5 characters)"/>
			<form:errors path="password" cssClass="error"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="password" class="col-sm-2 control-label">Confirm Password:</label>
		<div class="col-sm-10">
			<input type="password" name="password_again" id="password_again" class="form-control" placeholder="Confirm your password" />
		</div>
	</div>
	

	<div class="form-group">
		<div class="col-sm-2">
			<input type="submit" value="Save" class="btn btn-lg btn-primary">
		</div>
	</div>
</form:form>
<script type="text/javascript">
	$(document).ready(function(){
		$(".registrationForm").validate(
			{
				rules: {
					name: {
						required : true,
						minlength : 3,
						remote : {
							url : "<spring:url value='/register/available.html' />",
							type : "get",
							data : {
								username : function(){
									return $("#name").val();
								}
							}
						}
					},
					email: {
						required : true,
						email : true
					},
					password: {
						required : true,
						minlength : 5
					},
					password_again: {
						required : true,
						minlength : 5,
						equalTo: "#password"
					}
				},
				
				highlight: function(element){
					$(element).closest('.form-group').removeClass('has-success has-feedback').addClass('has-error has-feedback');
					$(element).closest('.form-group').find('i.fa').remove();
		            $(element).closest('.form-group').append('<i class="fa fa-exclamation fa-lg form-control-feedback"></i>');
				},
				
				unhighlight: function(element){
					$(element).closest('.form-group').removeClass('has-error has-feedback').addClass('has-success has-feedback')
					$(element).closest('.form-group').find('i.fa').remove();
		            $(element).closest('.form-group').append('<i class="fa fa-check fa-lg form-control-feedback"></i>');
				},
				
				messages:{
					name: {
						remote: "Such username already exists!"
					}
				}
			}		
		);
	});
</script>