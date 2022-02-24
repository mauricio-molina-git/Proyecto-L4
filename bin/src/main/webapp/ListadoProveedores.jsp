<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de proveedores</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="JS/Tablas.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/ListadoProveedores.css">
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

	<div class="titulo">Proveedores registrados</div>

	<div class="panelBusqueda">
		<form action="ServletListadoProveedores" method="post">
			Buscar por nombre <input type="text" name="txtBusqueda">
			<input type="submit" name="btnBuscar" value="Buscar"
				style="height: 26px"> <br>
			<br> Filtrar por: 
			Provincia
			<select name="selProvincia">
				<option value="-1">Seleccionar</option>
				<c:forEach items="${listaProvincias}" var="provincia">
					<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
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

	<div class="tablaProveedores">
		<table class="w3-table-all" id="Proveedores">
			<thead>
				<tr class="w3-light-grey w3-hover-grey">
					<th>Id Proveedor</th>
					<th>Nombre Proveedor</th>
					<th>eMail</th>
					<th>Teléfono</th>
					<th>Dirección</th>
					<th>Localidad</th>
					<th>Provincia</th>
					<th>Estado</th>
					<th>Modificar</th>
					<th>Eliminar</th>
				</tr>
			</thead>
			<c:forEach items="${listaProveedores}" var="proveedor">
				<tr class="w3-hover-orange">
					<td>${proveedor.getIdProveedor()}</td>
					<td>${proveedor.getNombre()}</td>
					<td>${proveedor.getEmail()}</td>
					<td>${proveedor.getTelefono()}</td>
					<td>${proveedor.getDireccion()}</td>
					<td>${proveedor.getLocalidad().getNombre()}</td>
					<td>${proveedor.getLocalidad().getProvincia().getNombre()}</td>
					<c:choose>
						<c:when test="${proveedor.getEstado()==true}">
							<td>Activo</td>
						</c:when>
						<c:otherwise>
							<td>Inactivo</td>
						</c:otherwise>
					</c:choose>
					<td><a href="ServletProveedores?IdModificar=${proveedor.getIdProveedor()}">Modificar</a></td>
					<td><a href="ServletBajas?IdProveedor=${proveedor.getIdProveedor()}">Eliminar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

<script type="text/javascript">
		$(document).ready(function() {
			$('#Proveedores').dataTable();
		});
	</script>

</body>
</html>