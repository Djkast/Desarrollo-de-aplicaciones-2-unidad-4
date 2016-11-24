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
					<h1>Welcome Store Manage</h1>
				</div>
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