<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="JS/aviso.js"></script>
<title>Agregar Categoria</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/StyleAgregarCategoria.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">

<body onload="mensaje(${estado})" style="background-image: url('imagenes/FondoAdmin.png'); background-repeat: no-repeat;background-image: fixed;
	background-image: center;">

	<jsp:include page="MenuAdmin.jsp"></jsp:include>

	<div class="Titulo"><h2 style="font-family: 'Patua One', cursive; font-size:30px; margin-left:35px">Agregar Categoría</h2></div>

	<div class="User">Usuario conectado: <%=request.getSession().getAttribute("nombreusuario")%>
		<a href="ServletUsuario">
		 <input type="submit" name="btnCerrarSesion" value="Cerrar Sesión"  class="btn btn-danger"  />
		</a>
	</div>

	<div class="ImagenLogoCompuPais">
		<img src="imagenes/logoCompuPaisBlanco.png" width="200px"
			height="75px">
	</div>

	<div class="Categorias" style="	border-style:double; width: 450px; height:120px; border-color:white; border-radius: 25px">
		<form action="ServletCategorias" method="post">
			Descripcion Categoría:
			 <input type="text" name="txtDescripcion" maxlength="30" placeholder="Descripción categoría"
				style="width: 165px; height: 27px; position: absolute; margin-left: 10px;" class="btn btn-light" required/>
			<br><br> 
			<input type="submit" name="btnAgregar" value="Agregar"
				style="position: absolute; margin-left: 157px;" class="btn btn-warning" />
		</form>
	</div>
</body>

</html>