<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de usuarios</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="JS/Tablas.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/ListadoUsuarios.css">
<link rel="stylesheet" href="CSS/DataTable.css">
</head>

<body>

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" />
		</a>
	</div>

	<div class="titulo">Usuarios registrados</div>
	
	<div class="panelBusqueda">
		<form action="ServletListadoUsuarios" method="post">
			Buscar por nombre <input type="text" name="txtBusqueda">
			<input type="submit" name="btnBuscar" value="Buscar"
				style="height: 26px"> <br>
			<br> Filtrar por: 
			Rol
			<select name="selTipoUsuario">
				<option value="-1">Seleccionar</option>
				<c:forEach items="${listaTiposUsuario}" var="tipo">
					<option value="${tipo.getTipo()}">${tipo.getDescripcion()}</option>
				</c:forEach>
			</select>
			Estado <select name="selEstado">
				<option value="-1">Seleccionar</option>
				<option value="1">Activo</option>
				<option value="0">Inactivo</option>
			</select> <input type="submit" name="btnFiltrar" value="Filtrar"
				style="height: 26px">
			<input type="submit"
				name="btnReiniciar" value="Reiniciar" style="height: 26px">
		</form>
	</div>
	
	<div class="tablaUsuarios">
		<table class="w3-table-all" id="Usuarios">
			<thead>
				<tr class="w3-light-grey w3-hover-grey">
					<th>Apellidos</th>
					<th>Nombres</th>
					<th>DNI Usuario</th>
					<th>eMail</th>
					<th>Teléfono</th>
					<th>Dirección</th>
					<th>Rol</th>
					<th>Estado</th>
					<th>Modificar</th>
					<th>Eliminar</th>
				</tr>
			</thead>
			<c:forEach items="${listaUsuarios}" var="usuario">
				<tr class="w3-hover-orange">
					<td>${usuario.getApellidos()}</td>
					<td>${usuario.getNombres()}</td>
					<td>${usuario.getIdUsuario().getDNI()}</td>
					<td>${usuario.geteMail()}</td>
					<td>${usuario.getTelefono()}</td>
					<td>${usuario.getDireccion()}</td>
					<td>${usuario.getTipoUsuario().getDescripcion()}</td>
					<c:choose>
						<c:when test="${usuario.getEstado()==true}">
							<td>Activo</td>
						</c:when>
						<c:otherwise>
							<td>Inactivo</td>
						</c:otherwise>
					</c:choose>
					<td><a
						href="ServletGuardarUsuario?IdModificar=${usuario.geteMail()}">Modificar</a></td>
					<td><a
						href="ServletBajas?IdUsuario=${usuario.geteMail()}">Eliminar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

<script type="text/javascript">
		$(document).ready(function() {
			$('#Usuarios').dataTable();
		});
	</script>

</body>
</html>