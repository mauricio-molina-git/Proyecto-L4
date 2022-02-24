<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light row">
			<div class=" col-md-6 col-sm-6 col-xs-6">
            	<button type="button" id="sidebarCollapse" class="btn btn-info" style="background-color: #ff8a15;">
                	<i class="fas fa-align-left"></i>
                	<span>Barra lateral</span>
            	</button>
            </div>
            <div class=" col-md-6 col-sm-6 col-xs-6 item-right">
			<% if(session.getAttribute("Nickname")!=null){ %>
				Bienvenido: <%= session.getAttribute("Nickname") %>
				<br>
				<a href="ServletModificarDatosPersonales">
					<input type="button" name="btnModificar" value="Modificar perfil"/>
				</a>
				<a href="ServletUsuario">
					<input type="submit" name="btnCerrarSesion" value="Cerrar Sesión"/>
				</a>
			<%} 
			else
			{ %>
				<a href="ServletLogin">
        			<img src="imagenes/iniciarSesion.png" class="img-fluid" style="height:80px">
        		</a>
			<%} %>
        	</div>
    </nav>
</body>
</html>