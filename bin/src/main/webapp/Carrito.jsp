<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
	<link type="text/css" rel="stylesheet" href="CSS/BarraLateral.css">
	<link type="text/css" rel="stylesheet" href="CSS/Carrito.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<title>Página principal</title>
<title>Insert title here</title>
</head>


<body>
<div class="wrapper">

	<c:import url="Barra.jsp"/>

    <!-- Contenido de la pagina -->	
	<div class="pb-5" id="content">
		<jsp:include page="ControlBarra.jsp"></jsp:include>	
    <div class="container">
      <div class="row">
        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Productos</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Precio</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Cantidad</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Quitar</div>
                  </th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${listaCarrito}" var="Producto">
                <tr>
                  <th scope="row" class="border-0">
                    <div class="p-2">
                      <img src="${Producto.getImagen()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"> <a href="ServletArticulo?IdProducto=${Producto.getIdProducto()}" class="text-dark d-inline-block align-middle">${Producto.getNombre()}</a></h5>
                      </div>
                    </div>
                  </th>
                  <td class="border-0 align-middle"><strong>$${Producto.getPrecioUnitario()}</strong></td>
                  <td class="border-0 align-middle"><strong>${Producto.getCantidad()}</strong></td>
                  <td class="border-0 align-middle"><a href="ServletCarrito?IdBaja=${Producto.getIdProducto()}" class="text-dark"><i class="fa fa-trash"></i></a></td>
                </tr>
                <tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

<script type="text/javascript">
	function Verificar(Resultado){
		if(Resultado=='0'){
			alert("No hay productos agregados al carrito");
			return;
		}
		document.location.href = '${pageContext.request.contextPath}/ServletPago';
	}
</script>

      <div class="row py-5 p-4 bg-white rounded shadow-sm">
      	<div class="col-lg-6">
      	</div>
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Resumen </div>
          <div class="p-4">
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                <h5 class="font-weight-bold">$${Resultado}</h5>
              </li>
            </ul><button class="btn btn-dark rounded-pill py-2 btn-block" onclick="Verificar(${Resultado})">Iniciar pago</button>
          </div>
        </div>
      </div>

   	  </div>
 	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript"> window.onload = alertName; </script>
<script type="text/javascript">

//Mostrar categorías 
$(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });

    $("#sidebar").mCustomScrollbar({
         theme: "minimal"
    });
});

</script>

</body>
</html>