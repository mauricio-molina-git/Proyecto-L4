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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/StyleAgregarProducto.css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">

<body onload="mensaje(${estado})" style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes\logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Titulo" style="background: center;"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px;">Agregar producto</h2></div>

	<div class="User">
		Usuario conectado:
		<%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> 
		<input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger" />
		</a>
	</div>
	
	<div class="ProductosIzquierda" style="	border-style:double; width: 730px; border-color:white; border-radius: 25px">
	
		<form method="post" action="ServletProductos">
			Nombre producto:
			 <input type="text" name="txtNombre"
				style="position: absolute; margin-left: 27px; width: 165px; height:27px" class="btn btn-light"
				placeholder="Nombre producto"
			required/>
			
			<br><br>
			 Descripcion producto:
			<textarea name="txtDescripcion" placeholder="Nombre producto"
				style="position: absolute; margin-left: 4px; width: 165px; height: 56px; border-radius: 4px">				
			</textarea>
			<br><br>
			
			<div class="textoImagen">
				Imagen producto: <input type="file" name="File"
					style="position: absolute; margin-left: 27px; width: 270px; height: 25px; margin-top: 0px;"></input>
			</div>
			
			<div class="ProductosDerecha" style="height: 100px">
				Precio unitario:
			 <input type="text" name="txtPrecioUnitario"
				 style="position: absolute; width: 165px; height:27px" class="btn btn-light"
				 placeholder="Precio producto" required pattern="(^[0-9]{1,9}$|^[0-9]{1,9}\.[0-9]{1,3}$)"
				  title="El precio puede tener 9 digitos antes del punto y 3 despues del mismo."
			 required/>
					 
				<br><br>
				 Stock: 
			 <input type="text" name="txtStock"
					style="position: absolute; margin-left: 60px; width: 165px; height:27px;" class="btn btn-light" 
					placeholder="Stock producto" title="El stock debe estar compuesto por un numero entero"			
					required pattern="^\d+$" 
			  required/>
					
				<br><br>
				 Categoría:
				  <select name="cmbCategoria"
					style="position: absolute;margin-left: 31px; width: 165px; height:27px; border-radius:4px">
					<option selected value="-1">Seleccione una categoria</option>
					<c:forEach items="${listaCategorias}" var="categoria">
						<option value="${categoria.getIdCategoria()}">${categoria.getDescripcion()}</option>
					</c:forEach>
				</select>
				
				 <br><br>
				 Proveedor:
				 <select name="cmbProveedor"
					style="position: absolute;margin-left: 27px; width: 165px; height:27px; border-radius:4px">
					<option selected value="-1">Seleccione un proveedor</option>
					<c:forEach items="${listaProveedores}" var="proveedor">
						<option value="${proveedor.getIdProveedor()}">${proveedor.getNombre()}</option>
					</c:forEach>
				</select>
				<br><br>
				<input type="submit" name="btnAgregar" value="Agregar" class="btn btn-warning">
			</div>	
		</form>
	</div>

</body>
</html>