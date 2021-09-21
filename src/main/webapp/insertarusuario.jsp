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
    <button onclick="window.location.href='listausuarios.jsp'" class="nav-link active" id="user" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true"><i class="fas fa-user-tie"></i> Usuarios</button>
  </li>

  <li class="nav-item" role="presentation">
    <button onclick="window.location.href='listaclientes.jsp'"class="nav-link" id="customer" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false"><i class="fas fa-address-book"></i> Clientes</button>
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
					role="alert">Error al crear el usuario, verifique que no exista un usuario con la cedula y usuario dados</div>
					
<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Usuario creado con exito</div>
  <div class="input-group mb-3">
  <span class="input-group-text">   Cedula   </span>
  <input type="text" class="form-control" placeholder="Ingrese Cedula" aria-label="Username" aria-describedby="basic-addon1" id="cedula_usuario">
</div>
<div class="input-group mb-3">
  <span class="input-group-text">   Nombre </span>
  <input type="text" class="form-control" placeholder="Ingrese Nombre completo" aria-label="Username" aria-describedby="basic-addon1" id="nombre_usuario">
</div>
<div class="input-group mb-3">
  <span class="input-group-text">Correo Electronico</span>
  <input type="text" class="form-control" placeholder="Ingrese Correo electronico" aria-label="Username" aria-describedby="basic-addon1"  id="email_usuario">
</div>

<div class="input-group mb-3">
  <span class="input-group-text">   Usuario   </span>
  <input type="text" class="form-control" placeholder="Ingrese Usuario" aria-label="Username" aria-describedby="basic-addon1" id="usuario">
</div>
<div class="input-group mb-3">
  <span class="input-group-text">  Contraseña  </span>
  <input type="text" class="form-control" placeholder="Ingrese Contraseña" aria-label="Username" aria-describedby="basic-addon1"  id="password">
</div>
<button type="button" class="btn btn-success"  onclick="enviar()">Insertar</button><br>
<h3>Operaciones</h3><br>
<button type="button" class="btn btn-success">Crear Usuario</button>


<button type="button" class="btn btn-danger">Eliminar Usuario</button>
<button type="button" class="btn btn-warning">Actualizar Usuario</button> 

<button type="button" class="btn btn-secondary">Consultar Usuario</button>
	<button type="button" class="btn btn-info" onclick="window.location.href='listarusuarios.jsp'">Lista Usuarios</button>
</section>
	<footer>Tiendida la Generica del 2  | 2021
  
</footer>
<script>
		function enviar() {
			var x = document.getElementById("usuario").value;
			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarusuarios', false);
			req.send(null);
			var usuarios=null;
			if (req.status == 200)
				usuarios=JSON.parse(req.responseText);
			  	console.log(JSON.parse(req.responseText));
			  	
			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].usuario);
				console.log(usuarios[i].cedula_usuario);
				if (usuarios[i].usuario ===x ) {
					console.log(usuarios[i].usuario +" "+x);	
					coincidencia =true
					break;
				}
				
				if (usuarios[i].cedula_usuario ===y ) {
					console.log(usuarios[i].cedula_usuario +" "+y);	
					coincidencia =true
					break;
				}
			}
			console.log(coincidencia);	
			
			if (coincidencia==false){
				var formData = new FormData();
	 			formData.append("cedula_usuario", document.getElementById("cedula_usuario").value);
	 			formData.append("email_usuario", document.getElementById("email_usuario").value);
	 			formData.append("nombre_usuario", document.getElementById("nombre_usuario").value);
	 			formData.append("password",document.getElementById("password").value);
	 			formData.append("usuario",document.getElementById("usuario").value);
	 			var xhr = new XMLHttpRequest();
	 			xhr.open("POST", "http://localhost:8080/registrarusuario");
	 			
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("usuario").value = "";
	 			xhr.send(formData);

			}else{
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("usuario").value = "";
			}	
		}
	</script>
  </body>
</html>