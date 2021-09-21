<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Insertando Usuarios</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8e9e769e03.js" crossorigin="anonymous"></script>
  </head>
  
  <body>
    <!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="listausuarios.jsp"><i class="fas fa-shopping-basket"></i> Tiendita Generica del 2</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
      
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button onclick="window.location.href='listarusuarios.jsp'" class="nav-link " id="user" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-user-tie"></i> Usuarios</button>
  </li>

  <li class="nav-item" role="presentation">
    <button onclick="window.location.href='listaclientes.jsp'"class="nav-link active" id="customer" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false"><i class="fas fa-address-book"></i> Clientes</button>
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
	
<section class="form-inuser">
<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al crear el Ciente, verifique que no exista un cliente con la cedula </div>
					
<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Cliente creado con exito</div>
  <div class="input-group mb-3">
  <span class="input-group-text">   Cedula   </span>
  <input type="text" class="form-control" placeholder="Ingrese Cedula" aria-label="Username" aria-describedby="basic-addon1" id="cc">
</div>
<div class="input-group mb-3">
  <span class="input-group-text">   Nombre </span>
  <input type="text" class="form-control" placeholder="Ingrese Nombre completo" aria-label="Username" aria-describedby="basic-addon1" id="nombre">
</div>
<div class="input-group mb-3">
  <span class="input-group-text">Correo Electronico</span>
  <input type="text" class="form-control" placeholder="Ingrese Correo electronico" aria-label="Username" aria-describedby="basic-addon1"  id="correo">
</div>

<div class="input-group mb-3">
  <span class="input-group-text">   Direccion   </span>
  <input type="text" class="form-control" placeholder="Ingrese Usuario" aria-label="Username" aria-describedby="basic-addon1" id="direccion">
</div>
<div class="input-group mb-3">
  <span class="input-group-text">  Telefono  </span>
  <input type="text" class="form-control" placeholder="Ingrese Contraseña" aria-label="Username" aria-describedby="basic-addon1"  id="telefono">
</div>
<button type="button" class="btn btn-success"  onclick="enviar()">Insertar</button><br>
<h3>Operaciones</h3><br>
<button type="button" class="btn btn-success">Crear Cliente</button>


<button type="button" class="btn btn-danger">Eliminar Cliente</button>
<button type="button" class="btn btn-warning">Actualizar Cliente</button> 

<button  class="btn btn-secondary">Consultar Cliente</button>
<button  class="btn btn-info" onclick="window.location.href='listarclientes.jsp'">Lista Clientes</button>
</section>
	<footer>Tiendida la Generica del 2  | 2021
  
</footer>
<script>
		function enviar() {
			var y = document.getElementById("cc").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarClientes', false);
			req.send(null);
			var usuarios=null;
			if (req.status == 200)
				usuarios=JSON.parse(req.responseText);
			  	console.log(JSON.parse(req.responseText));
			  	
			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].cc);
				if (usuarios[i].cc ===y ) {
					console.log(usuarios[i].cc +" "+y);	
					coincidencia =true
					break;
				}
				
			}
			console.log(coincidencia);	
			
			if (coincidencia==false){
				var formData = new FormData();
	 			formData.append("cc", document.getElementById("cc").value);
	 			formData.append("correo", document.getElementById("correo").value);
	 			formData.append("nombre", document.getElementById("nombre").value);
	 			formData.append("direccion",document.getElementById("direccion").value);
	 			formData.append("telefono",document.getElementById("telefono").value);
	 			var xhr = new XMLHttpRequest();
	 			xhr.open("POST", "http://localhost:8080/registrarCliente");
	 			
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				document.getElementById("cc").value = "";
				document.getElementById("correo").value = "";
				document.getElementById("nombre").value = "";
				document.getElementById("direccion").value = "";
				document.getElementById("telefono").value = "";
	 			xhr.send(formData);

			}else{
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cc").value = "";
				document.getElementById("correo").value = "";
				document.getElementById("nombre").value = "";
				document.getElementById("direccion").value = "";
				document.getElementById("telefono").value = "";
			}	
		}
	</script>
  </body>
</html>