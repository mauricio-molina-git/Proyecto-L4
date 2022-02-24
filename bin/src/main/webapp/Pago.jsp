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
      					<div class="row ">
              				<div class="col-md-12">
                  				<input type="text" name="tarjeta" class="form-control" placeholder="Ingresar número de tarjeta" />
              				</div>
          				</div>
          				<input type="hidden" name="listaCarrito" value="${listaCarrito}">
     					<div class="row ">
              				<div class="col-md-3 col-sm-3 col-xs-3">
                  				<span class="help-block text-muted small-font" > Mes expiración</span>
                  				<input type="text" name="mes" class="form-control" placeholder="MES" />
              				</div>
         					<div class="col-md-3 col-sm-3 col-xs-3">
                  				<span class="help-block text-muted small-font" >  Año expiración</span>
                  				<input type="text" name="año" class="form-control" placeholder="AÑO" />
              				</div>
        					<div class="col-md-3 col-sm-3 col-xs-3">
                 				<span class="help-block text-muted small-font" >  Código de seguridad</span>
                  				<input type="text" class="form-control" placeholder="CCV" />
              				</div>
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
                 				<input type="submit"  class="btn btn-danger" value="CANCELAR" />
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
<% 
String error = request.getParameter("error");
if(error != null) {
	if(error.equals("formato")) {
		%>
		Los datos deben ser numéricos.
		<%
	} else if(error.equals("mes")) {
		%>
		El mes es incorrecto.
		<%
		
	} else if(error.equals("año")) {
		%>
		El año es incorrecto.
		<%
		
	} else if(error.equals("tarjeta")) {
		%>
		La tarjeta es incorrecta.
		<%
	}
}
%>
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
</body>
</html>