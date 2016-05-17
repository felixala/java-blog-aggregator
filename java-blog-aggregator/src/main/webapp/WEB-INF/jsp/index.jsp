<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../layout/taglib.jsp"%>

<h1>Latest News from Peru!</h1>

<table class="table table-bordered table-hover table-striped">
	<thead>
		<tr>
			<th>Date</th>
			<th>Item</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${items}" var="item">
			<tr>
				<td>
					<c:out value="${item.published}" />
					<br />
					<strong>
						<c:out value="${item.blog.name}"></c:out>
					</strong>
				</td>
				
				
				<td><strong> <a href="<c:out value="${item.link}"/>"
						target="_bllank"> <c:out value="${item.title}"></c:out>
					</a>
				</strong> <br /> ${item.description}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
