package com.proyecto.java.controller;

import com.proyecto.java.dao.usuarioDao;
import com.proyecto.java.model.usuarioModel;
import com.proyecto.java.utils.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class authController {

    @Autowired
    private usuarioDao UsuarioDao;

    @Autowired
    private JWTUtil jwtUtil;

    @RequestMapping(value = "api/login", method = RequestMethod.POST)
    public String login(@RequestBody usuarioModel usuario) {

        usuarioModel usuarioLogueado= UsuarioDao.obtenerUsuarioPorCredenciales(usuario);

        if (usuarioLogueado != null){
            String tokenJWT = jwtUtil.create(String.valueOf(usuarioLogueado.getId()), usuarioLogueado.getEmail());
            return tokenJWT;
        } else {
            return "FAIL";
        }
    }
}
