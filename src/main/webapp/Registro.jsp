<%@page import="test.Funciones"%>
<%@page import="Entidades.Localidad"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Provincia"%>
<%@page import="java.util.List"%>
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
	<link type="text/css" rel="stylesheet" href="CSS/Pago.css">
	<link type="text/css" rel="stylesheet" href="CSS/Filtro.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
	<script src="JS/cmbDependientes.js"></script>
	<script src="JS/aviso.js"></script>
	
	<title>Registrarse</title>
</head>

<script type="text/javascript">
	idProvincias = crearLista('${idProvincias}');
	idLocalidades = crearLista('${idLocalidades}');
	nombreLocalidades = crearLista('${nombreLocalidades}');
</script>

<body onload="mensaje(${estado})">
	<c:import url="Barra.jsp"/>

	<div id="content">
        <jsp:include page="ControlBarra.jsp"></jsp:include>
        
        <div id='container'>
  			<div class='signup'>
     			<form method="post" action="ServletGuardarUsuario">
       				<input type='text' placeholder='Nombre:' name="Nombre" required/>
       				<input type='text' placeholder='Apellido:' name="Apellido" required/>
       				<input type='password' placeholder='Contraseña:' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$" title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos."  name="Contraseña" required/>
       				<input type='password' placeholder='Repita contraseña' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$" title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos." name="Contraseña2" required/>   				
					<input type='text' placeholder="Correo electronico" required pattern="^[^@]+@[^@]+\.[a-zA-Z]{2,}$" title="Correo invalido, debe contener un @ y como minimo un punto." name="Email" required/>
       				<input type='text' placeholder='Teléfono:' required pattern="^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$" title="El numero debe contener el prefijo 11 y luego los 8 digitos correspondientes  sin espacios. Se permite optar por el codigo de area 54." name="Telefono" required/>
       				<br>Tipo de DNI:
       				<select class="custom-select select-title" data-toggle="dropdown" id="filtrocollapse" name="TipoDeDni">
       					<option value="DNI">DNI</option>
       					<option value="CI">CI</option>
       					<option value="LE">LE</option>
       					<option value="LC">LC</option>
       				</select>
       				<input type='text' placeholder='DNI:' required pattern="^[a-z0-9_-]{7,8}$" title="DNI invalido, no debe contener puntos y debe ir de 7 a 8 digitos" name="DNI" required/>
       				<input type='text' placeholder='Dirección:' name="Direccion" required/>
       				<br>Provincia:
       				<select class="custom-select select-title" data-toggle="dropdown"
						id="filtrocollapse" name="cmbProvincia"
						onchange="listarLocalidades(this.value, document.forms[0].cmbLocalidad)">
						<option selected value="-1">Seleccione una provincia</option>
						<c:forEach items="${listaProvincias}" var="Provincia">
							<option value="${Provincia.getIdProvincia()}">${Provincia.getNombre()}</option>
						</c:forEach>
					</select>
					<br>Localidad:
					<select class="custom-select select-title" data-toggle="dropdown" id="filtrocollapse" name="cmbLocalidad">
					</select>
					<input type="submit" name="btnCrearCuenta" value="Crear cuenta"/>
     			</form>
  			</div>
		</div>
    </div> 
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">

//Mostrar categorías 
$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
    
    $('#filtrocollapse').on('click', function () {
    	$('#tablafiltro').toggleClass('show');
    });
    
    $("#sidebar").mCustomScrollbar({
         theme: "minimal"
    });
});
</script>

</body>
</html>