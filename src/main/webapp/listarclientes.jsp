<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Lista Clientes</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8e9e769e03.js" crossorigin="anonymous"></script>
  
  <script>
	var baseurl = "http://localhost:8080/listarClientes";
	function loadusuarios() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var usuarios = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-success table-striped'><tr><th>Cedula</th><th>Email</th><th>Nombre</th><th>direccion</th><th>telefono</th></tr>";
				var main = "";
				for (i = 0; i < usuarios.length; i++) {
					main += "<tr><td>" + usuarios[i].cc
							+ "</td><td>" + usuarios[i].correo
							+ "</td><td>" + usuarios[i].nombre
							+ "</td><td>" + usuarios[i].direccion
							+ usuarios[i].telefono + "</td><td>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("clienteInfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadusuarios();
	}
</script>
  
  </head>
  <body>
    <!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="listarclientes.jsp"><i class="fas fa-shopping-basket"></i> Tiendita Generica del 2</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
      
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button onclick="window.location.href='listarusuarios.jsp'" class="nav-link" id="user" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-user-tie"></i> Usuarios</button>
  </li>

  <li class="nav-item" role="presentation">
    <button onclick="window.location.href='listarclientes.jsp'"class="nav-link active" id="customer" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false"><i class="fas fa-address-book"></i> Clientes</button>
  </li>
  <li class="nav-item" role="presentation">
    <button onclick="window.location.href=''"class="nav-link" id="proveedor" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"><i class="fas fa-truck-loading"></i> Proveedores</button>
  </li>
  <li onclick="window.location.href=''"class="nav-item" role="presentation">
    <button class="nav-link" id="Productos" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"> <i class="fas fa-cubes"></i> Productos</button>
  </li>
  <li class="nav-item" role="presentation">
    <button onclick="window.location.href=''"class="nav-link" id="ventas" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"> <i class="fas fa-money-bill-wave"></i> Ventas </button>
  </li>
  <li class="nav-item" role="presentation">
    <button onclick="'''"class="nav-link" id="reportes" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false"><i class="fas fa-book"></i> Reportes </button>
  </li>
</ul>

		
		</div>
	</nav>

  <div style="padding-left: 5px;">
	
		<h1><i class="fas fa-list-ol"></i> Tabla de Clientes</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="clienteInfo">
					
					</div>
	
				</div>
			</div>
	<div>
		<h3>Operaciones</h3><br>
	<button type="button" class="btn btn-success" onclick="window.location.href='insertarcliente.jsp'">Crear Cliente</button>


	<button type="button" class="btn btn-danger">Eliminar Cliente</button>
	<button type="button" class="btn btn-warning">Actualizar Cliente</button> 

	<button type="button" class="btn btn-secondary">Consultar Cliente</button>
	<button class="btn btn-info" onclick="window.location.href='listarclientes.jsp'">Lista Clientes</button>
	</div>	
	<footer>Tiendida la Generica del 2  | 2021
  
</footer>
  </body>
</html>