package com.proyecto.java.dao;

import com.proyecto.java.model.usuarioModel;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class usuarioDaoImp implements usuarioDao{

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<usuarioModel> getUsuarios() {
        String query = "FROM usuarioModel";
        return entityManager.createQuery(query).getResultList();
    }

    @Override
    public void eliminar(Long id) {
        usuarioModel usuario = entityManager.find(usuarioModel.class, id);
        entityManager.remove(usuario);
    }

    @Override
    public void registrar(usuarioModel usuario) {
        entityManager.merge(usuario);
    }

    @Override
    public usuarioModel obtenerUsuarioPorCredenciales(usuarioModel usuario){
        String query = "FROM usuarioModel WHERE email = :email";
        List<usuarioModel> lista = entityManager.createQuery(query)
                .setParameter("email", usuario.getEmail())
                .getResultList();

        if (lista.isEmpty()){
            return null;
        }
        String passwordHashed = lista.get(0).getPassword();

        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        if (argon2.verify(passwordHashed, usuario.getPassword())){
            return lista.get(0);
        }
        return null;
    }
}
