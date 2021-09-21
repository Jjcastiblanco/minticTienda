package com.misiontic2022.Generica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.misiontic2022.tiendaGenerica.DAO.ClienteDAO;
import com.misiontic2022.tiendaGenerica.DTO.ClienteVO;


@RestController
public class ClienteController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */
	
	
	@PostMapping("/registrarCliente")
	public void registrarUsuario(ClienteVO cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarcliente(cliente);
	}

	@GetMapping("/consultarCliente")
	public ArrayList<ClienteVO> consultarUsuarios(String cliente) {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.consultarcliente(cliente);
	}

	@GetMapping("/listarClientes")
	public ArrayList<ClienteVO> listaDeclientes() {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.listaDeClientes();
	}
	@DeleteMapping("/eliminarCliente")
	public void eliminarUsuario(Integer cedula_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarcliente(cedula_cliente);
	}
	
	@PutMapping("/actualizarCliente")
	public void actualizarUsuario(ClienteVO cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarcliente(cliente);
	}
	
	
}
