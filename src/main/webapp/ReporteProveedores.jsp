<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"
	integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70="
	crossorigin="anonymous"></script>
		
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="JS/Tablas.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/ReporteCategorias.css">
<link rel="stylesheet" href="CSS/DataTables.css">
<link rel="preconnect" href="https://fonts.gstatic.com">

<link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">

<title>Reportes proveedores</title>
</head>
<body style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>
	
	<div class="ImagenLogoCompuPais">
		<img src="imagenes\logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>
	
		<div class="Titulo"><h2 style="font-family: 'Anton', sans-serif; margin-left:30px">Reportes: Proveedores</h2></div>
	<div class="SubTitulo">Por defecto se muestran las estadisticas del actual semestre</div>
	
	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> 
		<input type="submit" name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger" />
		</a>
	</div>
	
	<div class="panelFechaReporte">
		<form action="ServletReporteProveedores" method="get">
			Fecha de inicio: <input type="date" name="fechaInicio">
			Fecha de fin: <input type="date" name="fechaFin">
			<input type="submit" name="btnAceptar" value="Aceptar" class="btn btn-primary">
	
		</form>
	</div>
	
	<div style="height:40px; width: 400px; margin-top:-745px; margin-left:580px">
		<h3 style="font-family: 'Nerko One', cursive;">Porcentajes de ventas por proveedor</h3>
	</div>
		  
  		<div id="content-graf" style="margin-left:30%; margin-top:2%; 	position: absolute;">
			<canvas id="grafico"></canvas>
		</div>
  
	<script type="text/javascript">
		var valores = JSON.parse('${porcentajes}')
		var etiquetas = JSON.parse('${proveedores}');

		var ctx = document.getElementById('grafico').getContext('2d');
		var chart = new Chart(ctx, {
			type : 'doughnut',
			data : {
				datasets : [ {
					label : '% de ventas',
					data : valores,
					backgroundColor : [ '#75FA00', '#FA00D8', 'green', 'blue',
							'grey' ]
				} ],
				labels : etiquetas
			},
			options : {
				responsive : true
			}
		});
	</script>



	<script type="text/javascript">
		$(document).ready(function() {
			$('#ReporteProveedores').dataTable();
		});
	</script> 
</body>
</html>