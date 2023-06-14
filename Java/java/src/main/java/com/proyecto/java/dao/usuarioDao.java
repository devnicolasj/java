package com.proyecto.java.dao;

import com.proyecto.java.model.usuarioModel;

import java.util.List;

public interface usuarioDao {
    List<usuarioModel> getUsuarios();

    void eliminar(Long id);

    void registrar(usuarioModel usuario);

    usuarioModel obtenerUsuarioPorCredenciales(usuarioModel usuario);
}
