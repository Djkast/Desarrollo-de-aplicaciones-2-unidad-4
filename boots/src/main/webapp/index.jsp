<%@page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Bootstrap sample| Home</title>
	<link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	
</head>
<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Home</a>
			<div class="nav navbar-nav">
				<ul class="nav navbar-nav">
					<li><a href="new-tasks">Manage Task</a></li>
					<li><a href="all-tasks">All tasks</a></li>
					<li><a href="new-stores">Manage Store</a></li>
					<li><a href="all-stores">All Stores</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Task Manager</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${task.dateCreated}"/></td>
									<td>${task.finished}</td>
									<td><a href="update-tasks?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-tasks?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${task.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description" value="${task.description}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>		
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>
	
	
	
		
		<c:when test="${mode == 'MODE_STORES'}">
			<div class="container text-center" id="storesDiv">
				<h3>My Stores</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Address</th>
								<th>Telephone</th>
								<th>Email</th>
								<th>Rfc</th>
								<th>Year of construction</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="store" items="${stores}">
								<tr>
									<td>${store.id}</td>
									<td>${store.name}</td>
									<td>${store.address}</td>
									<td>${store.telephone}</td>
									<td>${store.email}</td>
									<td>${store.rfc}</td>
									<td>${store.yearOfConstruction}</td>
									<td><a href="update-store?id=${store.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-store?id=${store.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW_STORE' || mode == 'MODE_UPDATE_STORE'}">
			<div class="container text-center">
				<h3>Manage Store</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-store">
					<input type="hidden" name="id" value="${store.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${store.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Address</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="address" value="${store.address}"/>
						</div>				
					</div>		
					<div class="form-group">
						<label class="control-label col-md-3">Telephone</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="telephone" value="${store.telephone}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="email" value="${store.email}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Rfc</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="rfc" value="${store.rfc}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Year of Construction</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="yearOfConstruction" value="${store.yearOfConstruction}"/>
						</div>				
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>
		
				
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>