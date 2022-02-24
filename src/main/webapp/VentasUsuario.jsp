<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link type="text/css" rel="stylesheet" href="CSS/BarraLateral.css">
	<link type="text/css" rel="stylesheet" href="CSS/Carrito.css">
	<link rel="stylesheet" href="CSS/ListadoVentas.css">
	<link rel="stylesheet" href="CSS/DataTable.css">
	
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="JS/Tablas.js"></script>
	<title>Ventas de usuario</title>
</head>
<body style="background: none">
	<c:import url="Barra.jsp"/>
	<div class="pb-5" id="content">
		<jsp:include page="ControlBarra.jsp"></jsp:include>	
	</div>
	
	<div class="tablaVentas" style="background-color: #ff8a15">
		<table class="w3-table-all" id="Ventas">
			<thead>
				<tr class="w3-light-grey w3-hover-grey">
					<th>Fecha</th>
					<th>Producto</th>
					<th>Cantidad</th>
					<th>Precio por unidad</th>
					<th>Método de pago</th>
				</tr>
			</thead>
			<c:forEach items="${listaVentas}" var="venta">
				<c:forEach items="${venta.getDetalle()}" var="detalle">
				<tr class="w3-hover-orange">
					<td>${venta.getFechaVenta()}</td>
					<td>${detalle.getProducto().getNombre()}</td>
					<td>${detalle.getCantidad()}</td>
					<td>${detalle.getPrecioVenta()}</td>
					<td>${venta.getMetodoPago().getDescripcion()}</td>
				</tr>
				</c:forEach>
			</c:forEach>
		</table>
	</div>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript">
		//Mostrar categorías 
		$(document).ready(function() {
			$('#Ventas').dataTable();
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar, #content').toggleClass('active');
				$('.collapse.in').toggleClass('in');
				$('a[aria-expanded=true]').attr('aria-expanded', 'false');
			});

			$("#sidebar").mCustomScrollbar({
				theme : "minimal"
			});
		});
	</script>
</body>
</html>