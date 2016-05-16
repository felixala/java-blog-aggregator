<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>
<style>
    .error {
        color: red; font-weight: bold;
    }
</style>

<h1>Welcome <c:out value="${user.name}"/></h1>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  New Blog
</button>

<form:form commandName="blog" cssClass="form-horizontal blogForm">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">New Blog</h4>
      </div>
      <div class="modal-body">

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Name:</label>
						<div class="col-sm-10">
							<form:input path="name" cssClass="form-control" placeholder="Blog's name"/>
							<form:errors path="name" cssClass="error"/>
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">URL:</label>
						<div class="col-sm-10">
							<form:input path="url" cssClass="form-control" placeholder="http://www.example.com"/>
							<form:errors path="url" cssClass="error"/>
						</div>
					</div>

				</div>
				
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="Save">
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
</form:form>

<br></br>

<script type="text/javascript">
	$(document).ready(function(){
		$('.nav-tabs a:first').tab('show'); // Select first tab
		$(".triggerRemove").click(function(e){
			e.preventDefault();
			$("#modalRemove .removeBtn").attr("href",$(this).attr("href"));
			$("#modalRemove").modal();
		});
		
		
		$(".blogForm").validate(
				{
					rules: {
						name: {
							required : true,
							minlength : 1
						},
						url: {
							required : true,
							url : true
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
					}
				}		
		
		);
		
	});
</script>

<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
  	<c:forEach items="${user.blogs}" var="blog">
  		<li role="presentation"><a href="#blog_${blog.id}" aria-controls="home" role="tab" data-toggle="tab">${blog.name}</a></li>
 	</c:forEach>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
  	<c:forEach items="${user.blogs}" var="blog">
    	<div role="tabpanel" class="tab-pane active" id="blog_${blog.id}">
    		<h1><c:out value="${blog.name}"/></h1>
			<p>
			<a href="<spring:url value="/blog/remove/${blog.id}.html" />" class="btn btn-danger triggerRemove">Remove Blog</a>
			
			<c:out value="${blog.url}"/></p>
	
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>Date</th>
				<th>Item</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${blog.items}" var="item">
				<tr>
					<td><c:out value="${item.published}"/></td>
					<td>
						<strong>
							<a href="<c:out value="${item.link}"/>" target="_bllank">
								<c:out value="${item.title}"></c:out>
							</a>
						</strong>
						<br />
						${item.description}
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
    	</div>
    </c:forEach>
  </div>
  
<!-- Modal Window for removing blog - Warning! -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Remove Blog</h4>
      </div>
      <div class="modal-body">
        Really remove?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		<a href="" class = "btn btn-danger removeBtn">Remove</a>
      </div>
    </div>
  </div>
</div>
  
  
  
</div>


