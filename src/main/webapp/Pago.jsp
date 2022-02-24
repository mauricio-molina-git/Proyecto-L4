<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
	<link type="text/css" rel="stylesheet" href="CSS/BarraLateral.css">
	<link type="text/css" rel="stylesheet" href="CSS/Productos.css">
	<link type="text/css" rel="stylesheet" href="CSS/Filtro.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<title>Pago</title>
</head>
<body>

<div class="wrapper">

    <c:import url="Barra.jsp"/>

    <div id="content">
        <jsp:include page="ControlBarra.jsp"></jsp:include>
        
        <div class="container">
        	<form method="post" action="ServletCompraExitosa" class="credit-card-div">
				<div class="panel panel-default" >
 					<div class="panel-heading">
 					
 					<span class="help-block text-muted small-font" > Seleccione tipo de tarjeta</span>
        			<select class="custom-select select-title" data-toggle="dropdown" id="filtrocollapse" name="metodoPago">
       					<option value="C">Tarjeta credito</option>
       					<option value="D"> Tarjeta debito</option>
       				</select><br>
 					
      					<div class="row ">
              				<div class="col-md-12">
              				    <span class="help-block text-muted small-font" > Numero de tarjeta</span>           				
                  				<input type="text" class="form-control" placeholder="Ingresar número de tarjeta" required pattern="^(?:4\d([\- ])?\d{6}\1\d{5}|(?:4\d{3}|5[1-5]\d{2}|6011)([\- ])?\d{4}\2\d{4}\2\d{4})$" title="Visa (16 y 13 dígitos empieza por 4) - MasterCard (16 dígitos empieza por 51 al 55) Discover (16 dígitos empieza por 6011)" min="0" required/>
              				</div>
          				</div>
          				<input type="hidden" name="listaCarrito" value="${listaCarrito}">
     					<div class="row ">
         					<div class="col-md-3 col-sm-3 col-xs-3">
                  				<span class="help-block text-muted small-font" > Mes expiración</span>
                  				<input type="text" required pattern="^(1[0-2]|[1-9])$" title="El mes debe estar entre 1 y 12" class="form-control" id="mes" required/>
              				</div>
              				<div class="col-md-3 col-sm-3 col-xs-3">
                  				<span class="help-block text-muted small-font" > Año expiración</span>
                  				<input type="text" class="form-control" required pattern="(2[123456789]|3[0])" title="Debe ingresar los 2 ultimos digitos del año de vencimiento. El mismo debe encontrarse entre el año 2021 y 2030" id="anio" required/>
              				</div>
        					<div class="col-md-3 col-sm-3 col-xs-3">
                 				<span class="help-block text-muted small-font" >  Código de seguridad</span>
                  				<input type="text" class="form-control" required pattern="^[0-9]{3,4}$" title="El codigo CCV contiene 4 digitos si esta en el frente de su tarjeta o 3 si se encuentra en la parte trasera." placeholder="CCV" min="0" required/>
              				</div>
              				<br>
              				
         					<div class="col-md-3 col-sm-3 col-xs-3">
								<img src="imagenes/tarjeta.png" class="img-fluid" style="width: 80px; height: 70px"/>
         					</div>
          				</div>
     					<div class="row">
							<div class="col-md-12 pad-adjust">
							</div>
     					</div>
       					<div class="row ">
           					<div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                 				
              				</div>
              				<div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                  				<input type="submit"  class="btn btn-warning btn-block" value="PAGAR" />
              				</div>
          				</div>
                   	</div>
              	</div>
			</form>
       	</div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">

//Mostrar categorías 
$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });

    $("#sidebar").mCustomScrollbar({
         theme: "minimal"
    });
});
</script>
<script type="text/javascript">
$(document).ready(function () {
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

document.getElementById("mes").setAttribute("min", mm);

document.getElementById("anio").setAttribute("min", yyyy);
});
</script>
</body>
</html>