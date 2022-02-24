<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="JS/aviso.js"></script>
<script src="JS/cmbDependientes.js"></script>
<title>Modificar usuario</title>
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

	<div class="Titulo"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px">Modificar usuario</h2></div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger" />
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Usuario" style="height: 630px; width: 340px; border-color:white; border-radius: 25px; margin-left:60px; border-style: double;">
		<form action="ServletGuardarUsuarioMod" method="post">
			<input type="hidden" name="IdUsuario" value="${usuario.geteMail()}">
		
			Nombres:
			 <input type="text" name="Nombre" 	value="${usuario.getNombres()}"
				style="width: 165px; height: 27px; position: absolute; margin-left: 25px;" class="btn btn-light"
			 required/>
			<br><br>
			Apellidos:
			 <input type="text" name="Apellido"	value="${usuario.getApellidos()}" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 24px;" class="btn btn-light" 
			 required/>
			<br><br>
			
			Tipo Dni: 
			<select name="TipoDeDni"
				style="position: absolute; margin-left: 28px; width: 165px; height: 27px;  border-radius:5px"">
				<option value="${usuario.getIdUsuario().getTipoDNI()}">${usuario.getIdUsuario().getTipoDNI()}</option>
			</select> 
			<br><br> 
			
			Dni:
			 <input type="text" name="txtDNI" value="${usuario.getIdUsuario().getDNI()}"
			 placeholder='DNI:' required pattern="^[a-z0-9_-]{7,8}$" title="DNI invalido, no debe contener puntos y debe ir de 7 a 8 digitos" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 61px;" class="btn btn-light"
			disabled 
			required/>
			
			<input type="hidden" name="DNI" value="${usuario.getIdUsuario().getDNI()}">
			<br><br> 
			
			Email: 
			<input type="text" name="txtEmail"	value="${usuario.geteMail()}" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 49px;" class="btn btn-light"
			disabled required/>
			
			<input type="hidden" name="Email" value="${usuario.geteMail()}">
			
			<br><br>
			Password: 
			<input type="password" name="Contraseña" value="${usuario.getPassword()}"
				placeholder='Contraseña:' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$" 
				title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos." 
				style="width: 165px; height: 27px; position: absolute; margin-left: 22px;" class="btn btn-light"
			required/>
			<br><br>
			Repita pass: 
			<input type="password" name="Contraseña2" value="${usuario.getPassword()}"
				placeholder='Repita contraseña:' required pattern="^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$" 
				title="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula. NO puede tener otros símbolos." 
				style="width: 165px; height: 27px; position: absolute; margin-left: 10px;" class="btn btn-light"
			required/>
			<br><br>
			Telefono: 
			<input type="text" name="Telefono" value="${usuario.getTelefono()}" 
				style="width: 165px; height: 27px; position: absolute; margin-left: 28px;"
				placeholder='Teléfono:' required pattern="^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$"
				title="El numero debe contener el prefijo 11 y luego los 8 digitos correspondientes  sin espacios. Se permite optar por el codigo de area 54." 
				class="btn btn-light"
			required/>
			<br><br>
			 Dirección: <input type="text" name="Direccion"
				value="${usuario.getDireccion()}" required
				style="width: 165px; height: 27px; position: absolute; margin-left: 22px;" class="btn btn-light" />
			<br><br> 
			Provincia:
			 <select name="cmbProvincia"
				style="position: absolute; margin-left: 23px; width: 165px; height: 27px; border-radius: 4px"
				onchange="listarLocalidades(this.value, document.forms[0].cmbLocalidad)">
				<option selected value="-1">Seleccione una provincia</option>
				<c:forEach items="${listaProvincias}" var="provincia">
					<c:choose>
						<c:when
							test="${usuario.getLocalidad().getProvincia().equals(provincia)}">
							<option selected value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
						</c:when>
						<c:otherwise>
							<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			 <br><br>
			  Localidad:
			   <select name="cmbLocalidad" style="position: absolute; margin-left: 21px; width: 165px; height: 27px; border-radius: 5px">
				<option selected
					value="${usuario.getLocalidad().getIdLocalidad()}">${usuario.getLocalidad().getNombre()}</option>
			</select> 
			<br><br> Tipo usuario:
			 <select name="cmbTipoUsuario"	style="position: absolute; margin-left: 4px; width: 165px; height: 27px; border-radius:5px">
				<c:forEach items="${listaTiposUser}" var="tipo">
					<c:choose>
						<c:when test="${usuario.getTipoUsuario().equals(tipo)}">
							<option selected value="${tipo.getTipo()}">${tipo.getDescripcion()}</option>
						</c:when>
						<c:otherwise>
							<option value="${tipo.getTipo()}">${tipo.getDescripcion()}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select> <br> <br> 
			<input type="submit" name="btnModificar" value="Modificar"	style="position: absolute; margin-left: 90px;" class="btn btn-warning" />
		</form>
	</div>
</body>
</html>