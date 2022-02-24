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
	<title>Descripción</title>
</head>
<body>


    <c:import url="Barra.jsp"/>

    <!-- Contenido de la pagina -->
    <div id="content">
        <jsp:include page="ControlBarra.jsp"></jsp:include>
        
        <div class="prod-info-main prod-wrap clearfix">
                	<div class="row">
                     	<div class="col-md-5 col-sm-12 col-xs-12">
                           	<div class="product-image">
                             	<img src="${Producto.getImagen()}" class="img-fluid" >
                       		</div>
                  		</div>
    				<div class="col-md-7 col-sm-12 col-xs-12">
                  	<div class="product-deatil">
                    	<h5 class="name text-uppercase">
                        	<span>${Producto.getNombre()} </span>                     
                        </h5>
                        <p class="price-container">
                            <span>$${Producto.getPrecioUnitario()}  </span>
                        </p>
                        <p>
                        	<span>Stock: ${Producto.getStock()}  </span>
                        </p>
                        <p>
                        	<span>${Producto.getDescripcion()}  </span>
                        </p>
              			<span class="tag1"></span>
   					</div>
   					<form method="post" action="ServletCarrito">
						<div class="product-info smart-form">
							<div class="row">
								<div class="col-md-6">
									<span>Cantidad:</span> <input id="minimo" type="number" min="1" max="${Producto.getStock()}"
										value="1" name="Cantidad">
										<input type="hidden" name="IdProducto" value="${Producto.getIdProducto()}">
								</div>
								<div class="col-md-6">
									<input class="btn btn-danger" type="submit" value="Agregar al carrito" name="btnAgregar"/>
								</div>
							</div>
						</div>
					</form>
  					</div>
 			 		</div>
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
</body>
</html>