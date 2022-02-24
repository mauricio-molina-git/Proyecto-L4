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
<link rel="stylesheet" href="CSS/StyleAgregarProveedor.css">

<script type="text/javascript">
	idProvincias = crearLista('${idProvincias}');
	idLocalidades = crearLista('${idLocalidades}');
	nombreLocalidades = crearLista('${nombreLocalidades}');
</script>

<body onload="mensaje(${estado})">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="Titulo">Nuevo proveedor</div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
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

	<form method="post" action="ServletProveedores">
		<div class="Proveedor">
			Email proveedor: <input type="text" name="txtEmail" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 25px;" />
			<br> <br> Nombre proveedor: <input type="text"
				name="txtNombreProv" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 12px;" />
			<br> <br> Telefono: <input type="number" name="txtTelefono"
				required
				style="width: 180px; height: 17px; position: absolute; margin-left: 73px;" />
			<br> <br> Dirección: <input type="text" name="txtDireccion"
				required
				style="width: 180px; height: 17px; position: absolute; margin-left: 67px;" />
			<br> <br> Provincia: <select name="cmbProvincia"
				style="position: absolute; margin-left: 68px; width: 185px; height: 22px;"
				onchange="listarLocalidades(this.value, document.forms[0].cmbLocalidad)">
				<option selected value="-1">Seleccione una provincia</option>
				<c:forEach items="${listaProvincias}" var="provincia">
					<option value="${provincia.getIdProvincia()}">${provincia.getNombre()}</option>
				</c:forEach>
			</select> <br> <br> Localidad: <select name="cmbLocalidad"
				style="position: absolute; margin-left: 67px; width: 185px; height: 22px;"></select>
			<br> <br> <input type="submit" name="btnAgregar"
				value="Agregar"
				style="width: 100px; height: 30px; position: absolute; margin-left: 120px; margin-top: 11px;" />
		</div>
	</form>

</body>
</html>