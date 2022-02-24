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
	
	<title>Modificación</title>
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
     			<form method="post" action="ServletGuardarUsuarioModificado">
     				<input type="hidden" name="IdUsuario" value="${usu.geteMail()}">
     				
     				Nombre:
       				<input type='text' placeholder='Nombre:'  name="Nombre" value="${usu.getNombres()}" required/>
       				
       				Apellido:
       				<input type='text' placeholder='Apellido:' name="Apellido" value="${usu.getApellidos()}" required/> 			       				
       				
       				Contraseña:<br>
       				<input type='password' placeholder='Contraseña:'
       				placeholder='Contraseña:' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"
       				title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos."
       				 name="Contraseña" value="${usu.getPassword()}"  required/>
       				<br>
       				Repita contraseña:<br>
       				<input type='password' placeholder='Repita contraseña:'
       				placeholder='Contraseña:' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"
       				title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos."
       				name="Contraseña2" value="${usu.getPassword()}"  required/>      				
       				<br>
       				Correo:
       				<input type='text' placeholder='Email:'
       				placeholder="Correo electronico" 
       				name="txtEmail" value="${usu.geteMail()}" disabled required/>       				
       				<input type="hidden" name="Email" value="${usu.geteMail()}">       				
       				
       				Telefono:
       				<input type='text' placeholder='Teléfono:'
       				placeholder='Teléfono:' required pattern="^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$"
       				title="El numero debe contener el prefijo 11 y luego los 8 digitos correspondientes  sin espacios. Se permite optar por el codigo de area 54."
       				name="Telefono" value="${usu.getTelefono()}"  required/>
       				 
       				<br>Tipo de DNI:
       				<select class="custom-select select-title" data-toggle="dropdown" id="filtrocollapse" name="TipoDeDni">
       					<option value="${usu.getIdUsuario().getTipoDNI()}" >${usu.getIdUsuario().getTipoDNI()}</option>
       				</select>
       				<br>
    				DNI:      				
       				<input type='text' placeholder='DNI' name="txtDNI" value="${usu.getIdUsuario().getDNI()}" disabled required/>     				
					<input type="hidden" name="DNI" value="${usu.getIdUsuario().getDNI()}">       				
       				
       				Dirección: 
       				<input type='text' placeholder='Dirección:' name="Direccion" value="${usu.getDireccion()}" required/>
       				
       				<br>Provincia: <select class="custom-select select-title"
						data-toggle="dropdown" id="filtrocollapse" name="cmbProvincia"
						onchange="listarLocalidades(this.value, document.forms[0].cmbLocalidad)">
						<c:forEach items="${listaProvincias}" var="provincia">
							<c:choose>
								<c:when
									test="${usu.getLocalidad().getProvincia().equals(provincia)}">
									<option selected value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
								</c:when>
								<c:otherwise>
									<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<br>Localidad: <select class="custom-select select-title"
						data-toggle="dropdown" id="filtrocollapse" name="cmbLocalidad">
					</select> 					
					<input type="submit" name="btnModificar" value="Modificar cuenta"/>
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