<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/DataTables.css">

</head>
<body style="background: #1b1b56; color: black;">

	<input type="button" id="Boton1" value="Accion1" onclick="f()">
	<input type="button" id="Boton2" value="Accion2" onclick="g()">
	<select id="testSel">
		<option value="1">OPC 1</option>
		<option value="2">OPC 2</option>
		<option value="3">OPC 3</option>
	</select>

	<div id="cont-tabla"
		style="position: absolute; top: 200px; left: 500px; width: 1000px; color: black;">
		<table id="testTable" class="w3-table-all" style="width: 900px">
			<thead class="w3-light-grey w3-hover-grey">
				<tr>
					<td>Col1</td>
					<td>Col2</td>
					<td>Col3</td>
				</tr>
			</thead>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>SEK</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>DBZ</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>SEK</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>SEK</td>
				<td>Data3</td>
			</tr>
			<tr class="w3-hover-orange">
				<td>Data1</td>
				<td>Data2</td>
				<td>Data3</td>
			</tr>
		</table>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#testTable').dataTable();
		});

		function f() {
			var tabla = $('#testTable').DataTable();
			
			var cad = 'SEK';
			var filtrado = tabla.data().filter(function (valor, index) {
				if (valor[1] == cad) return true;
				else return false;
			});
			tabla.clear().rows.add(filtrado).draw();
		}
		
		function g() {
			$('#testTable').DataTable().destroy();
			$('#testTable').DataTable();
		}
		
		$('#testSel').on('change', function () {
			var opc = $('option:selected', this).text();
			alert(opc == 'OPC 2');
		});
	</script>

</body>
</html>