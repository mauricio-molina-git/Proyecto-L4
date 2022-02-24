<%@page import="Entidades.Proveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Categoria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar Producto</title>
<script src="JS/aviso.js"></script>
</head>
<link rel="stylesheet" href="CSS/StyleAgregarProducto.css">


<body onload="mensaje(${estado})">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes\logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Titulo">Nuevo producto</div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" />
		</a>
	</div>

	<div class="ProductosIzquierda">
		<form method="post" action="ServletProductos">
			Nombre producto: <input type="text" name="txtNombre" required
				style="position: absolute; margin-left: 27px; width: 150px; height: 16px;" />
			<br> <br> Descripcion producto:
			<textarea name="txtDescripcion"
				style="position: absolute; margin-left: 4px; width: 150px; height: 56px;"></textarea>
			<br> <br>
			<div class="textoImagen">
				Imagen producto: <input type="file" name="File"
					style="position: absolute; margin-left: 30px; width: 270px; height: 25px; margin-top: 0px;"></input>
			</div>
			<div class="ProductosDerecha">
				Precio unitario: <input type="text" name="txtPrecioUnitario"
					required style="position: absolute; width: 150px; height: 16px;" />
				<br> <br> Stock: <input type="text" name="txtStock"
					style="position: absolute; margin-left: 55px; width: 150px; height: 16px;" />
				<br> <br> Categoría: <select name="cmbCategoria"
					style="position: absolute; margin-left: 31px; width: 155px; height: 20px;">
					<option selected value="-1">Seleccione una categoria</option>
					<c:forEach items="${listaCategorias}" var="categoria">
						<option value="${categoria.getIdCategoria()}">${categoria.getDescripcion()}</option>
					</c:forEach>
				</select> <br> <br> Proveedor: <select name="cmbProveedor"
					style="position: absolute; margin-left: 27px; width: 155px; height: 20px;">
					<option selected value="-1">Seleccione un proveedor</option>
					<c:forEach items="${listaProveedores}" var="proveedor">
						<option value="${proveedor.getIdProveedor()}">${proveedor.getNombre()}</option>
					</c:forEach>
				</select>
			</div>
			<div class="botonAgregar">
				<input type="submit" name="btnAgregar" value="Agregar"
					style="width: 100px; height: 30px;" />
			</div>
		</form>
	</div>


	<div class="ImagenAdm">
		<img src="imagenes/logoAdmin.png" width="150" height="150">
	</div>

</body>
</html>