<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<!-- Barra lateral -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <img src="imagenes/logo.png" class="img-fluid">
        </div>
        <ul class="list-unstyled components">
        	<li>
        		<a href="ServletPrincipal">Inicio</a>
        	</li>
            <li>
                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Categorías</a>
                <ul class="collapse list-unstyled" id="pageSubmenu"">
                	<c:forEach items="${listaCategorias}" var="Item">
                    	<li>
                        	<a href="ServletPrincipal?Categoria=${Item.getIdCategoria()}">${Item.getDescripcion()}</a>
                    	</li>
                    </c:forEach>
                </ul>
            </li>
            <li>
            	<a href="ServletCarrito">Carrito</a>
            </li>
        </ul>
    </nav>
</body>
</html>