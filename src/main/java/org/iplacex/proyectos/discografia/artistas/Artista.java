package org.iplacex.proyectos.discografia.artistas;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document("artistas") // Colección en MongoDB
public class Artista {
    @Id
    public String _id;

    @Field(name = "nombre")
    public String nombre;
    public List<String> estilos;
    
    @Field(name = "anioFundacion")
    public int anioFundacion;
    public boolean estaActivo;
}
