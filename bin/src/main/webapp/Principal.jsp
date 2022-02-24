<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
	<link type="text/css" rel="stylesheet" href="CSS/BarraLateral.css">
	<link type="text/css" rel="stylesheet" href="CSS/Productos.css">
	<link type="text/css" rel="stylesheet" href="CSS/Filtro.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<title>Página principal</title>
</head>
<body>
<div class="wrapper">

    <!-- Barra lateral -->
    <jsp:include page="Barra.jsp"></jsp:include>

    <!-- Contenido de la pagina -->
    <div id="content">
        <jsp:include page="ControlBarra.jsp"></jsp:include>
    	
    	<div class="row">
				<form method="get" action="ServletPrincipal">
					<div class="col-md-3 col-sm-3 col-xs-3">
						<span>Ordenar por: </span>
						<select class="custom-select select-title" data-toggle="dropdown" id="filtrocollapse" name="Filtrolista">
							<option class="dropdown-item current js-search-link" value=" "> </option>
							<option class="dropdown-item current js-search-link" value=" ORDER BY Nombre ">De
								A a Z</option>
							<option class="dropdown-item current js-search-link" value=" ORDER BY Nombre DESC ">De
								Z a A</option>
							<option class="dropdown-item current js-search-link" value=" ORDER BY PrecioUnitario ">De
								menor a mayor precio</option> 
							<option class="dropdown-item current js-search-link" value=" ORDER BY PrecioUnitario DESC ">De
								mayor a menor precio</option>
						</select>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6 text-center">
						<div class="col-md-6 col-sm-6 col-xs-6">
								<span>Desde:</span> <input id="minimo" placeholder="$" type="number" min="0" name="minimo">
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6">
								<span>Hasta:</span> <input id="maximo" placeholder="$" type="number" min="0" name="maximo">
						</div>
					</div>
					<c:if test="${Categoria!=null }">
						<input type="hidden" name="Categoria" value="${Categoria}">
					</c:if>
					<div class="col-md-3 col-sm-3 col-xs-3 text-center">
						<input class="btn btn-info" type="submit" value="Borrar Filtro"
							style="background-color: #ff8a15;" name="btnBorrarFiltro">
						<input class="btn btn-info" type="submit" value="Filtrar"
							style="background-color: #ff8a15;" name="btnFiltrar">
					</div>
				</form>
			</div>
    	
    		<div class="container">
    	
            <c:forEach items="${listaProductos}" var="Atributo">
			<div class="col-xs-12 col-md-4">
                <!-- Comienzo del loop de productos-->
                <div class="prod-info-main prod-wrap clearfix">
                    <div>
                        <div class="product-image">
                        	<a href="ServletArticulo?IdProducto=${Atributo.getIdProducto()}">
                        		<img src="${Atributo.getImagen()}" class="img-fluid">
                       		</a>
                       	</div>
                  	</div>
    				<div>
                  		<div class="product-deatil">
                    		<h5 class="name">
                        		<a href="ServletArticulo?IdProducto=${Atributo.getIdProducto()}" class="text-uppercase" style="font-size:18px">${Atributo.getNombre()}</a>                         
                       		 </h5>
                        	<p class="price-container">
                        	    <span>$${Atributo.getPrecioUnitario()}</span>
                       	 	</p>
   						</div>
  					</div>
				</div>
			<!-- Fin del loop de productos -->
			</div>
			</c:forEach>

			</div>
			<nav aria-label="Navigation for countries">
				<ul class="pagination">
					<c:if test="${paginaActual != 1}">
						<c:choose>
							<c:when test="${Categoria !=null }">
								<li class="page-item"><a class="page-link"
									href="ServletPrincipal?RegistrosPorPagina=${RegistrosPorPagina}&paginaActual=${paginaActual-1}&Categoria=${Categoria}">Anterior</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="ServletPrincipal?RegistrosPorPagina=${RegistrosPorPagina}&paginaActual=${paginaActual-1}">Anterior</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>

					<c:forEach begin="1" end="${numeroDePaginas}" var="i">
						<c:choose>
							<c:when test="${paginaActual eq i}">
								<li class="page-item active"><a class="page-link"> ${i}
										<span class="sr-only">(current)</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${Categoria !=null }">
										<li class="page-item"><a class="page-link"
											href="ServletPrincipal?RegistrosPorPagina=${RegistrosPorPagina}&paginaActual=${i}&Categoria=${Categoria}">${i}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="ServletPrincipal?RegistrosPorPagina=${RegistrosPorPagina}&paginaActual=${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${paginaActual lt numeroDePaginas}">
						<c:choose>
							<c:when test="${Categoria !=null }">
								<li class="page-item"><a class="page-link"
									href="ServletPrincipal?RegistrosPorPagina=${RegistrosPorPagina}&paginaActual=${paginaActual+1}&Categoria=${Categoria}">Siguiente</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="ServletPrincipal?RegistrosPorPagina=${RegistrosPorPagina}&paginaActual=${paginaActual+1}">Siguiente</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</ul>
			</nav>
		</div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">

//Mostrar categorías 
$(document).ready(function () {

    $("#sidebar").mCustomScrollbar({
         theme: "minimal"
    });

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
    
    $('#filtrocollapse').on('click', function () {
        $('#tablafiltro').toggleClass('show');
    });

});

</script>

<script type="text/javascript">
var elMin = document.getElementById("minimo");
var elMax = document.getElementById("maximo");

function limit() {
	elMax.value=Math.max(elMin.value,elMax.value);
}

elMin.onchange=limit;
elMax.onchange=limit;
</script>
</body>
</html>