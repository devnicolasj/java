package com.proyecto.java.controller;

import com.proyecto.java.dao.usuarioDao;
import com.proyecto.java.model.usuarioModel;
import com.proyecto.java.utils.JWTUtil;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Constants;
import de.mkammerer.argon2.Argon2Factory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class usuarioController {

    @Autowired
    private usuarioDao UsuarioDao;

    @Autowired
    private JWTUtil jwtUtil;

    @RequestMapping(value = "api/usuarios/{id}", method = RequestMethod.GET)
    public usuarioModel getUsuario(@PathVariable Long id) {
        usuarioModel usuarioModelUno = new usuarioModel();
        usuarioModelUno.setId(id);
        usuarioModelUno.setNombre("Nicolas");
        usuarioModelUno.setApellido("Jaramillo");
        usuarioModelUno.setTelefono("123456789");
        usuarioModelUno.setEmail("contactonicolasj@gmail.com");
        return usuarioModelUno;
    }
    @RequestMapping(value = "api/usuarios")
    public List<usuarioModel> getUsuarios(@RequestHeader(value="Authorization", required = false) String token) {
        //if (!validarToken(token)) { return null; }

        return UsuarioDao.getUsuarios();
    }

    private boolean validarToken(String token) {
        String usuarioId = jwtUtil.getKey(token);
        return usuarioId != null;
    }

    @RequestMapping(value = "api/usuarios", method = RequestMethod.POST)
    public void registrarUsuario(@RequestBody usuarioModel usuario) {
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        String hash = argon2.hash(1, 1024, 1,usuario.getPassword());
        usuario.setPassword(hash);

        UsuarioDao.registrar(usuario);
    }
    @RequestMapping(value = "api/usuarios/{id}", method = RequestMethod.DELETE)
    public void eliminarUsuario(@RequestHeader(value="Authorization", required = false) String token, @PathVariable Long id) {
        //if (!validarToken(token)) { return; }
        UsuarioDao.eliminar(id);
    }
}
