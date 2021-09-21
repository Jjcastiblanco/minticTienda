<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>Login de la tienda 2</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="style.css">

</head>

<body>
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"><i
				class="fas fa-shopping-basket"></i> Tiendita Generica del 2</a>
		</div>
	</nav>

	<section class="form-login">

		<h5>Ingreso</h5>
		<div class="card-body">
			<form>

				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
					<input type="text" class="form-control" id="inputuser"
						placeholder="Usuario" required>
				</div>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-key"></i></span>
					</div>
					<input type="password" class="form-control" id="inputpass"
						placeholder="Contraseña" required>
				</div>
				<div style="margin: auto; text-align: center;">
					<button type="button" class="btn btn-success" onclick="comparar()">
						<i class="fas fa-sign-in-alt"></i> Iniciar Sesión
					</button>
				</div>

				<div id="error" class="alert alert-danger visually-hidden"
					role="alert"></div>
			</form>
		</div>
		<br>

		<p>
			<a href="#">¿Olvidaste tu contraseña?</a>
		</p>


	</section>

	<footer>Tiendida la Generica del 2 | 2021 </footer>
	<script>
		function comparar() {
			//trayendo texto de input de username
			var x = document.getElementById("inputuser").value;
			//trayendo texto de input de password
			var y = document.getElementById("inputpass").value;
			//url de la api 
			var baseurl = "http://localhost:8080/listarusuarios";
			//creando un objeto de manipulacion de solicitudes
			var xmlhttp = new XMLHttpRequest();
			//abriendo la api
			xmlhttp.open("GET", baseurl, true);
			//funcion interna que compara la información
			xmlhttp.onreadystatechange = function() {
				//si se obtiene un 200 (Conexion correcta)
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					//convirtiendo JSON en variable javascrip
					var usuarios = JSON.parse(xmlhttp.responseText);

					//verificando uno por uno si existe ese usuario
					for (i = 0; i < usuarios.length; i++) {

						//imprimiendo en la consola del navegador pata verificar
						console.log(usuarios);
						console.log(x);
						console.log(usuarios[i].usuario);
						console.log(y);
						console.log(usuarios[i].password);

						//si el nombre coincide
						if (usuarios[i].usuario === x) {
							//si la clave coincide
							if (usuarios[i].password === y) {
								console.log("si");
								var element = document.getElementById("error");
								element.classList.add("visually-hidden");
								document.getElementById("inputuser").value = "";
								document.getElementById("inputpass").value = "";
								window.location.href = "listarusuarios.jsp";
								return;
							} else {
								//si la clave NO coincide
								console.log("error clave");
								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								document.getElementById("inputuser").value = "";
								document.getElementById("inputpass").value = "";
								return;
							}
						}
					}
					//Si no existe el usuario
					console.log("no encontrado");

					//quitando la capacidad de ocultacion del error para mostrarlo
					var element = document.getElementById("error");
					element.classList.remove("visually-hidden");
					document.getElementById("inputuser").value = "";
					document.getElementById("inputpass").value = "";
					return;
				}
			};
			//ejecutando
			xmlhttp.send();
		}
	</script>
</body>
</html>