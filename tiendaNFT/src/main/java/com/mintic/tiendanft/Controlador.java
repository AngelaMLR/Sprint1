package com.mintic.tiendanft;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.mintic.tiendanft.client.IClientTienda;
import com.mintic.tiendanft.dto.LoginDto;
import com.mintic.tiendanft.dto.Usuario;
import com.mintic.tiendanft.dto.UsuarioResponse;

@Controller
public class Controlador {

	@Autowired
	IClientTienda clienteTienda;

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/menu")
	public String menu() {
		return "menu";
	}
	
	@PostMapping("/login")
	public String login(Model model, LoginDto loginDto) {
		int validLogin = clienteTienda.login(loginDto);

		if (validLogin == 1) {
			return "menu";
		} else {
			model.addAttribute("error", "Usuario o constraseña invalidos.");
			return "index";
		}

	}

	@GetMapping("/usuario")
	public String usuario(Model model) {

		model.addAttribute("tipoDocumento", clienteTienda.getTipoDocumento());
		model.addAttribute("usuarios", clienteTienda.getUsuarios());
		return "usuario";
	}

	@PostMapping("/usuario")
	public String crearUsuario(Model model, Usuario usuario) {

		clienteTienda.nuevoUsuario(usuario);

		model.addAttribute("tipoDocumento", clienteTienda.getTipoDocumento());
		model.addAttribute("usuarios", clienteTienda.getUsuarios());

		return "usuario";
	}

	@GetMapping("/usuario/{id}")
	public String actualizarUsuario(Model model, @PathVariable(name = "id") Long id) {

		UsuarioResponse usuarioEditar = clienteTienda.buscarUsuario(id);

		System.out.println(usuarioEditar.getNombre());
		model.addAttribute("usuarioEditar", usuarioEditar);
		model.addAttribute("tipoDocumento", clienteTienda.getTipoDocumento());
		model.addAttribute("usuarios", clienteTienda.getUsuarios());

		return "usuario";
	}

	@GetMapping("/eliminarusuario/{id}")
	public String eliminarUsuario(Model model, @PathVariable(name = "id") Long id) {

		clienteTienda.borrarUsuario(id);

		model.addAttribute("tipoDocumento", clienteTienda.getTipoDocumento());
		model.addAttribute("usuarios", clienteTienda.getUsuarios());

		return "usuario";
	}
}
