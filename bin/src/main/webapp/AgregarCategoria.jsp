<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="JS/aviso.js"></script>
<title>Agregar Categoria</title>
</head>
<link rel="stylesheet" href="CSS/StyleAgregarCategoria.css">

<body onload="mensaje(${estado})">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="Titulo">Nueva categoría</div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario"> <input type="submit"
			name="btnCerrarSesion" value="Cerrar Sesión" />
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Categorias">

		<form action="ServletCategorias" method="post">
			Descripcion Categoría: <input type="text" name="txtDescripcion" maxlength="30" required
				style="width: 180px; height: 17px; position: absolute; margin-left: 10px;" />
			<br> <br> <input type="submit" name="btnAgregar"
				value="Agregar"
				style="width: 100px; height: 30px; position: absolute; margin-left: 120px; margin-top: 20px;" />
		</form>

	</div>
	
	<div class="ImagenAdm">
		<img src="imagenes/logoAdmin.png" width="150" height="150">
	</div>

</body>

</html>