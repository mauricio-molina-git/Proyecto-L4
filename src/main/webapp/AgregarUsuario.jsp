<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="JS/aviso.js"></script>
<script src="JS/cmbDependientes.js"></script>

<title>Agregar usuario</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/AgregarUsuario.css">
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

	<div class="Titulo"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px">Agregar usuario</h2></div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> 
		<input type="submit" name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger" />
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Usuario" style="height: 630px; width: 340px; border-color:white; border-radius: 25px; margin-left:60px; border-style: double;">
		<form action="ServletGuardarUsuarioAdm" method="post">
			Nombres:
			 <input type="text" name="Nombre" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 30px;"
				placeholder='Nombre:' class="btn btn-light"
			required/>
			<br><br>
			
			 Apellidos:
			 <input type="text" name="Apellido"	
			 	placeholder='Apellido:'
				style="width: 165px; height: 27px; position: absolute; margin-left: 30px;" class="btn btn-light"
			required/>
			<br><br>
			
			Tipo Dni: <select name="TipoDeDni" 
				style="position: absolute; margin-left: 35px; width: 165px; height: 27px; border-radius: 4px">
				<option value="DNI">DNI</option>
				<option value="CI">CI</option>
				<option value="LE">LE</option>
				<option value="LC">LC</option>
			</select> 
			<br><br> 
			
			Dni: 
			<input type="text" name="DNI" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 67px;"
				placeholder='DNI' required pattern="^[a-z0-9_-]{7,8}$"
				title="DNI invalido, no debe contener puntos y debe ir de 7 a 8 digitos"
				class="btn btn-light"
			required/>
			<br><br> 
			
			Email: 
			<input type="text" name="Email" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 54px;" 
				placeholder="Correo electronico" required pattern="^[^@]+@[^@]+\.[a-zA-Z]{2,}$"
				title="Correo invalido, debe contener un @ y como minimo un punto." class="btn btn-light"
			required/>
			<br><br>
			
			 Password:
			 <input type="password" name="Contraseña" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 27px;" 
				placeholder='Contraseña' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"
				title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos."
				class="btn btn-light"
			required/>
			<br><br>
			
		    Repita pass: 
		    <input type="password" name="Contraseña2" 
			style="width: 165px; height: 27px; position: absolute; margin-left: 14px;" 
			placeholder='Repita contraseña' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$"
			title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos."
			class="btn btn-light"			
			required/>
			
			<br><br>  
			Telefono:
			<input type="text" name="Telefono"
				style="width: 165px; height: 27px; position: absolute; margin-left: 30px;"
				placeholder='Teléfono' required pattern="^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$"
				title="El numero debe contener el prefijo 11 y luego los 8 digitos correspondientes  sin espacios. Se permite optar por el codigo de area 54."
				class="btn btn-light"
			required />
			<br><br>
			Dirección: <input type="text" name="Direccion"
				style="width: 165px; height: 27px; position: absolute; margin-left: 23px;"
				placeholder="Dirección" class="btn btn-light"	
				required />
			<br><br>
			 Provincia: <select name="cmbProvincia"
				style="position: absolute; margin-left: 24px; width: 165px; height: 27px; border-radius: 4px"
				onchange="listarLocalidades(this.value, document.forms[0].cmbLocalidad)">
				<option selected value="-1">Seleccione una provincia</option>
				<c:forEach items="${listaProvincias}" var="provincia">
					<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
				</c:forEach>
			</select> <br> <br> Localidad: <select name="cmbLocalidad"
				style="position: absolute; margin-left: 22px; width: 165px; height: 27px; border-radius: 4px">
			</select> <br> <br> Tipo usuario: <select name="cmbTipoUsuario"
				style="position: absolute; margin-left: 4px; width: 165px; height: 27px; border-radius: 4px">
				<c:forEach items="${listaTiposUser}" var="tipo">
					<option value="${tipo.getTipo()}">${tipo.getDescripcion()}</option>
				</c:forEach>
			</select> <br><br> 
			<input type="submit" name="btnAgregar"
				value="Agregar"
				style="position: absolute; margin-left: 90px;" class="btn btn-warning" />
		</form>
	</div>
</body>
</html>