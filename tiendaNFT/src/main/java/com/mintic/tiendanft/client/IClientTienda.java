package com.mintic.tiendanft.client;

import java.util.List;

import com.mintic.tiendanft.dto.LoginDto;
import com.mintic.tiendanft.dto.TipoDocumento;
import com.mintic.tiendanft.dto.Usuario;
import com.mintic.tiendanft.dto.UsuarioResponse;

public interface IClientTienda {

	public int login(LoginDto loginDto);

	public List<UsuarioResponse> getUsuarios();

	public UsuarioResponse nuevoUsuario(Usuario usuarioDto);

	public UsuarioResponse buscarUsuario(Long id);

	public int borrarUsuario(Long id);

	public List<TipoDocumento> getTipoDocumento();
}
