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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/ListadoVentas.css">
<link rel="stylesheet" href="CSS/DataTable.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
</head>

<body style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> 
		<input type="submit" name="btnCerrarSesion" value="Cerrar Sesi�n" class="btn btn-danger"/>
		</a>
	</div>

	<div class="titulo" style="background: center;"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px;  width: 370px; margin-top: -25px">Registro de ventas:</h2></div>

	<div class="panelBusqueda">
		<form action="ServletListadoVentas" method="post">
			Buscar por DNI: 
			<input type="text" name="txtBusquedaDNI" placeholder="DNI cliente" class="btn btn-light">
			Correo: 
			<input type="text" name="txtBusquedaEmail" placeholder="Email cliente" class="btn btn-light"><br><br>
			<input type="submit" name="btnBuscar" value="Buscar" class="btn btn-primary">
			<input type="submit" name="btnReiniciar" value="Reiniciar" class="btn btn-warning">
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
					<th>M�todo de pago</th>
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