<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>usuario</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/menu">Tienda</a>

		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Usuarios

				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Clientes</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Proveedores</a></li>

				<li class="nav-item"><a class="nav-link" href="#">Ventas</a></li>

				<li class="nav-item"><a class="nav-link" href="#">Reportes</a></li>
			</ul>

		</div>
	</nav>
	<br>
	<h1>Gestionar Usuarios</h1>

	<div class="container">
		<% 
		
			
		/*List<TipoDocumento> tp =(List<TipoDocumento>) request.getAttribute("tipoDocumento");
		
		//request.getAttribute("tipoDocumento");
		Iterator<TipoDocumento> iteracion = tp.iterator();
						TipoDocumento td = null;

						while (iteracion.hasNext()) {
							td = iteracion.next();
							out.print(td.getTipo());
						}
		 
		
		out.print("----"+request.getAttribute("tipoDocumento"));
		*/
		%>
		<div class=" col-xl-2 col-lg-3 col-md-4 col-sm-6" id="formulario">
			<form method="post" action="/usuario">
				<div class="form-group">
					<label>tipo Documento :</label> <select name="idTipoDocumento"
						class="form-select">
						<option value="0">Seleccionar</option>
						<c:forEach items="${tipoDocumento}" var="tipos">
							<option value="${tipos.id}"
								${tipos.id == usuarioEditar.idTipoDocumento.id  ? 'selected' : '0' }>${tipos.tipo}</option>
						</c:forEach>
					</select>
				</div>


				<div class="form-group">
					<input type="hidden" name="id" value="${usuarioEditar.id}">

					<label for="numero"> numero:</label><input type="text"
						name="numeroDocumento" id="numero"
						value="${usuarioEditar.numeroDocumento}" class="form-control" />
				</div>
				<div class="form-group">
					<label>nombre:</label><input type="text" name="nombre"
						class="form-control" value="${usuarioEditar.nombre}" />
				</div>
				<div class="form-group">
					<label>Email:</label><input type="text" name="email"
						class="form-control" value="${usuarioEditar.email}" />
				</div>
				<div class="form-group">
					<label> nombre usuario:</label> <input type="text"
						name="nombreUsuario" class="form-control"
						value="${usuarioEditar.nombreUsuario}" />
				</div>
				<div class="form-group">
					<label>password:</label> <input type="password" name="password"
						class="form-control" value="${usuarioEditar.password}" />
				</div>

				<br>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</form>
		</div>

		<br> <br>

		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Tipo documento</th>
					<th>Numero</th>
					<th>Nombre</th>
					<th>Nombre usuario</th>
					<th colspan="2">Operaciones</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<td>${usuario.id}</td>
						<td>${usuario.idTipoDocumento.tipo}</td>
						<td>${usuario.numeroDocumento}</td>
						<td>${usuario.nombre}</td>
						<td>${usuario.nombreUsuario}</td>
						<td><a class="btn btn-danger"
							href="/eliminarusuario/${usuario.id}">Eliminar</a></td>
						<td><a class="btn btn-success" href="/usuario/${usuario.id}">Actualizar</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>