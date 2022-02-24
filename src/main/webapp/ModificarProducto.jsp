<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="JS/aviso.js"></script>
<title>Modificar Producto</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/StyleModificarProducto.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">

<body onload="mensaje(${estado})" style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="Titulo" style="background: center;"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px">Modificar producto</h2></div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> 
		<input type="submit" name="btnCerrarSesion" value="Cerrar Sesión" class="btn btn-danger"/>
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="ProductosIzquierda" style="	border-style:double; width: 731px; border-color:white; border-radius: 25px">
		<form method="post" action="ServletProductos">
		
			<input type="hidden" name="IdProducto"
				value="${producto.getIdProducto()}">
			Nombre producto:
			<input
				type="text" name="txtNombre" class="btn btn-light" value="${producto.getNombre()}"
				style="position: absolute; margin-left: 27px; width: 165px; height: 27px;" 
			required/>
			<br><br>
			Descripcion producto:
			 <input type="text" name="txtDescripcion" value="${producto.getDescripcion()}"
				style="position: absolute; margin-left: 4px; width: 165px; height: 56px; border-radius: 4px" />
			<br> <br><br><br>
			<div class="textoImagen">
				Imagen producto: <input type="file" name="File"	value="${producto.getImagen()}"	
					style="position: absolute; margin-left: 30px; width: 270px; height: 25px; margin-top: 0px;"></input>
			<br><br>
			<input type="hidden" value="${producto.getImagen()}"  name="txtImagen">
			</div>
			<div class="ProductosDerecha" style="height: 100px">
				Precio unitario:
				 <input type="text" name="txtPrecioUnitario" value="${producto.getPrecioUnitario()}" 
					style="position: absolute; width: 165px; height: 27px;" class="btn btn-light"
				 required/> 
			<br><br>
				 Stock:
				  <input type="text" name="txtStock" value="${producto.getStock()}"
					style="position: absolute; margin-left: 60px; width: 165px; height: 27px;" class="btn btn-light"/>
				<br><br>
				 Categoría: <select name="cmbCategoria"
					style="position: absolute; margin-left: 31px; width: 165px; height: 27px; border-radius: 4px">

					<option value="-1">Seleccione una categoria</option>
					<c:forEach items="${listaCategorias}" var="categoria">
						<c:choose>
							<c:when test="${producto.getCategoria().equals(categoria)}">
								<option selected value="${categoria.getIdCategoria()}">${categoria.getDescripcion()}</option>
							</c:when>
							<c:otherwise>
								<option value="${categoria.getIdCategoria()}">${categoria.getDescripcion()}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
				<br><br>
				 Proveedor: <select name="cmbProveedor"
					style="position: absolute; margin-left: 27px; width: 165px; height: 27px; border-radius: 4px">
					<option value="-1">Seleccione un proveedor</option>
					<c:forEach items="${listaProveedores}" var="proveedor">
						<c:choose>
							<c:when test="${producto.getProveedor().equals(proveedor)}">
								<option selected value="${proveedor.getIdProveedor()}">${proveedor.getNombre()}</option>
							</c:when>
							<c:otherwise>
								<option value="${proveedor.getIdProveedor()}">${proveedor.getNombre()}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<br><br>
				<input type="submit" name="btnModificar" value="Modificar" class="btn btn-warning" />
			</div>
				
			
		</form>
	</div>

</body>
</html>