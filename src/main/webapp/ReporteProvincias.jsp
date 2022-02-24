<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"
	integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70="
	crossorigin="anonymous">
	
</script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/ReporteProvincias.css">
<link href="https://fonts.googleapis.com/css2?family=Nerko+One&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">

<title>Reporte de venta por provincias</title>
</head>

<body onload="load()" style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes\logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Titulo"><h2 style="font-family: 'Anton', sans-serif; margin-left:30px">Reportes: provincias</h2></div>
	<div class="SubTitulo">Por defecto se muestran las estadisticas
		del año actual</div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit" name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger"/>
		</a>
	</div>

	<div class="panelFiltro" style="width: 755px">
		<form action="ServletReporteProvincias" method="get">
			Provincia: <select id="SelProvincias" name="cmbProvincias">
				<c:forEach items="${listaProvincias}" var="provincia">
					<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
				</c:forEach>
			</select> Año de reporte: <input type="number" id="Año" name="txtAnio">
			<input type="submit" name="btnAceptar" value="Aceptar" class="btn btn-primary">
		</form>
	</div>

	<div class="content-graf"
		style="position: absolute; top: 200px; left: 450px; width: 1100px; height: 570px; background-color: white;">
		<canvas id="myChart"></canvas>
	</div>

	<script>
	
		//VARIABLES GLOBALES --INICIO
		var grafico = {};
		var grafData = {
			labels : [ 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
					'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre',
					'Diciembre' ],
			datasets : []
		}
		var coloresBarras = new Array(12);
		for (var i=0; i<12; coloresBarras[i++] = '#B7EEB7');
		var coloresBordes = new Array(12);
		for (var i=0; i<12; coloresBordes[i++] = '#28D628');
		
		var ventas = [];
		//VARIABLES GLOBALES --FIN

		function load() {
			var hoy = new Date();
			document.getElementById('Año').value = hoy.getFullYear();

			ventas = JSON.parse('${datosVentas}');

			var idProvincia = document.getElementById('SelProvincias').value;
			var valores = generarDatosPorMes(idProvincia);

			var iniDataSet = {
				label : 'Recaudacion en $',
				data : valores,
				backgroundColor : coloresBarras,
				borderColor : coloresBordes,
				borderWidth : 3
			}

			grafData.datasets.push(iniDataSet);

			var ctx = document.getElementById('myChart').getContext('2d');
			grafico = new Chart(ctx, {
				type : 'horizontalBar',
				data : grafData,
				options : {
					title : {
						display : true,
						text : 'Estadistica anual'
					}
				}
			});
		}

		function generarDatosPorMes(idProvincia) {
			var meses = new Array(13);
			for (var i = 0; i < 13; meses[i++] = 0);

			for ( var i in ventas) {
				if (ventas[i].idProvincia == idProvincia) {
					var parcial = meses[ventas[i].mes - 1];
					meses[ventas[i].mes - 1] = parcial + ventas[i].importe;
				}
			}
			for ( var i in meses)
				meses[i] = Math.round(meses[i]);
			return meses;
		}

		document.getElementById('SelProvincias').addEventListener('change',
				function() {
					var valores = generarDatosPorMes(this.value);
					var newDataSet = {
						label : 'Recaudacion en $',
						data : valores,
						backgroundColor : coloresBarras,
						borderColor : coloresBordes,
						borderWidth : 3
					}
					
					grafData.datasets.pop();
					grafData.datasets.push(newDataSet);
					grafico.update();
				});
	</script>

</body>
</html>