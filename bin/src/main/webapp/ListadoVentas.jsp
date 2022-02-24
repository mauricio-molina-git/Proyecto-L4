<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de ventas</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="JS/Tablas.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/ListadoVentas.css">
<link rel="stylesheet" href="CSS/DataTable.css">
</head>


<body>

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" />
		</a>
	</div>

	<div class="titulo">Registro de ventas</div>

	<div class="panelBusqueda">
		<form action="ServletListadoVentas" method="post">
			Buscar por: DNI <input type="text" name="txtBusquedaDNI">
			eMail <input type="text" name="txtBusquedaEmail"> <input
				type="submit" name="btnBuscar" value="Buscar" style="height: 26px">
			<br> <br> Listar de <input type="date" name="FechaInicial">
			hasta <input type="date" name="FechaFinal"> <input
				type="submit" name="btnFiltrar" value="Filtrar" style="height: 26px">
			<input type="submit" name="btnReiniciar" value="Reiniciar"
				style="height: 26px">
		</form>
	</div>

	<div class="tablaVentas">
		<table class="w3-table-all" id="Ventas">
			<thead>
				<tr class="w3-light-grey w3-hover-grey">
					<th>Fecha</th>
					<th>Cliente</th>
					<th>ID Cliente</th>
					<th>Importe</th>
					<th>Método de pago</th>
				</tr>
			</thead>
			<c:forEach items="${listaVentas}" var="venta">
				<tr class="w3-hover-orange">
					<td>${venta.getFechaVenta()}</td>
					<td>${venta.getCliente().getApellidos()}
						${venta.getCliente().getNombres()}</td>
					<td>${venta.getCliente().geteMail()}</td>
					<td>${venta.getImporte()}</td>
					<td>${venta.getMetodoPago().getDescripcion()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#Ventas').dataTable();
		});
	</script>

</body>
</html>