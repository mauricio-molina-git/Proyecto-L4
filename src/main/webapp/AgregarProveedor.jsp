<%@page import="Entidades.Localidad"%>
<%@page import="Entidades.Provincia"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Proveedor</title>
<script src="JS/cmbDependientes.js"></script>
<script src="JS/aviso.js"></script>


</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/StyleAgregarProveedor.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">

<script type="text/javascript">
	idProvincias = crearLista('${idProvincias}');
	idLocalidades = crearLista('${idLocalidades}');
	nombreLocalidades = crearLista('${nombreLocalidades}');
</script>

<body onload="mensaje(${estado})" style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="Titulo"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px">Agregar Proveedor</h2></div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> 
		<input type="submit" name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger"/>
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<form method="post" action="ServletProveedores">
		<div class="Proveedor" style="height: 400px; width: 400px; border-color:white; border-radius: 25px; margin-left:40px; border-style: double;">
			CUIT:<input type="text" name="txtCuit"  style="margin-left: 110px; width: 165px; height: 27px;"
			placeholder='CUIT'  required pattern="\b(20|23|24|27|30|33|34)(\D)?[0-9]{8}(\D)?[0-9]"
			title="Se toleran CUIT con guiones, barras o solo digitos. ejemplos sin guiones: 23242207599 ej con guion: 23-24220759-9 ej barra: 23/24220759/9
			Recordar que el numero CUIT comienzan con 23,24,27,30,33,34." class="btn btn-light"
			required/>
			<br><br>
			
			Email proveedor:
			 <input type="text" style="width: 165px; height: 27px; position: absolute; margin-left: 33px;" name="txtEmail"
			 placeholder="Correo electronico" required pattern="^[^@]+@[^@]+\.[a-zA-Z]{2,}$"
			 title="Correo invalido, debe contener un @ y como minimo un punto." class="btn btn-light"
			 required/>		 
			<br><br> 
			
			Nombre proveedor:
			 <input type="text" name="txtNombreProv" style="width: 165px; height: 27px; position: absolute; margin-left: 13px;"
			 placeholder="Nombre proveedor" class="btn btn-light"
			 required/>
			<br><br> 
			
			Telefono:
			 <input type="text" name="txtTelefono" placeholder='Teléfono:' style="width: 165px; height: 27px; position: absolute; margin-left: 83px;"
			 required pattern="^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$" 
			 title="El numero debe contener el prefijo 11 y luego los 8 digitos correspondientes sin espacios. Se permite optar por el codigo de area 54." 
			 class="btn btn-light"
			 required/>
			<br><br> 
			Dirección: <input type="text" name="txtDireccion"
				style="width: 165px; height: 27px; position: absolute; margin-left: 77px;" 
				placeholder="Dirección" class="btn btn-light"
			required/>
				
			<br> <br> Provincia:
			 <select name="cmbProvincia"
				style="position: absolute; margin-left: 78px; width: 165px; height: 27px; border-radius: 4px"
				onchange="listarLocalidades(this.value, document.forms[0].cmbLocalidad)">
				<option selected value="-1">Seleccione una provincia</option>
				<c:forEach items="${listaProvincias}" var="provincia">
					<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
				</c:forEach>
			</select> 
			<br><br>
			 Localidad: <select name="cmbLocalidad"
				style="position: absolute; margin-left: 75px; width: 165px; height: 27px; border-radius: 4px">
			</select>
			<br> <br> <input type="submit" name="btnAgregar" value="Agregar"
				style="position: absolute; margin-left: 140px;" class="btn btn-warning" />
		</div>
	</form>

</body>
</html>