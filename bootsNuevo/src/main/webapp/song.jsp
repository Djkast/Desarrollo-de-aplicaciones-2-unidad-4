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
					<li><a href="new-song">Manage Song</a></li>
					<li><a href="all-songs">All Songs</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome Songs Manage</h1>
				</div>
			</div>
		</c:when>
	
	<c:when test="${mode == 'MODE_SONGS'}">
			<div class="container text-center" id="songsDiv">
				<h3>My Songs</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Artist</th>
								<th>Type</th>
								<th>Gender</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="song" items="${songs}">
								<tr>
									<td>${song.id}</td>
									<td>${song.name}</td>
									<td>${song.artist}</td>
									<td>${song.type}</td>
									<td>${song.gender}</td>
									<td><a href="update-song?id=${song.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-song?id=${song.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW_SONG' || mode == 'MODE_UPDATE_SONG'}">
			<div class="container text-center">
				<h3>Manage Song</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-song">
					<input type="hidden" name="id" value="${song.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${song.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Artist</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="artist" value="${song.artist}"/>
						</div>				
					</div>		
					<div class="form-group">
						<label class="control-label col-md-3">Type</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="type" value="${song.type}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Gender</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="gender" value="${song.gender}"/>
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