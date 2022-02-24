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
<link rel="stylesheet" href="CSS/AgregarUsuario.css">

<script type="text/javascript">
	idProvincias = crearLista('${idProvincias}');
	idLocalidades = crearLista('${idLocalidades}');
	nombreLocalidades = crearLista('${nombreLocalidades}');
</script>

<body onload="mensaje(${estado})">
	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="Titulo">Modificar usuario</div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" />
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="ImagenAdm">
		<img src="imagenes/logoAdmin.png" width="150" height="150">
	</div>

	<div class="Usuario">
		<form action="ServletGuardarUsuario" method="post">
			<input type="hidden" name="IdUsuario" value="${usuario.geteMail()}">
		
			Nombres: <input type="text" name="Nombre" required
				value="${usuario.getNombres()}"
				style="width: 180px; height: 17px; position: absolute; margin-left: 25px;" />
			<br> <br> Apellidos: <input type="text" name="Apellido"
				value="${usuario.getApellidos()}" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 22px;" />
			<br> <br> Tipo Dni: <select name="TipoDeDni"
				style="position: absolute; margin-left: 26px; width: 185px; height: 22px;">
				<option value="${usuario.getIdUsuario().getTipoDNI()}">${usuario.getIdUsuario().getTipoDNI()}</option>
			</select> <br> <br> Dni: <input type="text" name="DNI"
				value="${usuario.getIdUsuario().getDNI()}" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 57px;" />
			<br> <br> Email: <input type="text" name="Email"
				value="${usuario.geteMail()}" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 44px;" />
			<br> <br> Contraseña: <input type="password"
				name="Contraseña" value="${usuario.getPassword()}" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 12px;" />
			<br> <br> Telefono: <input type="text" name="Telefono"
				value="${usuario.getTelefono()}" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 27px;" />
			<br> <br> Dirección: <input type="text" name="Direccion"
				value="${usuario.getDireccion()}" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 21px;" />
			<br> <br> Provincia: <select name="cmbProvincia"
				style="position: absolute; margin-left: 22px; width: 185px; height: 22px;"
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
			</select> <br> <br> Localidad: <select name="cmbLocalidad"
				style="position: absolute; margin-left: 20px; width: 185px; height: 22px;">
				<option selected
					value="${usuario.getLocalidad().getIdLocalidad()}">${usuario.getLocalidad().getNombre()}</option>
			</select> <br> <br> Tipo usuario: <select name="cmbTipoUsuario"
				style="position: absolute; margin-left: 4px; width: 185px; height: 22px;">
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
			</select> <br> <br> <input type="submit" name="btnModificar"
				value="Modificar"
				style="width: 100px; height: 30px; position: absolute; margin-left: 100px; margin-top: 11px;" />
		</form>
	</div>
</body>
</html>