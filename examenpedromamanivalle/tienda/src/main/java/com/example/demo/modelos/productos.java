package com.example.demo.modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name="productos")
public class productos {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id ;
    private String nombre;
    private String descripcion ;
    private double precio ;
    private int cantidad ;
    private int categoria_id;

    
    public productos() {}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}


	public int getCantidad() {
		return cantidad;
	}


	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}


	public int getCategoria_id() {
		return categoria_id;
	}


	public void setCategoria_id(int categoria_id) {
		this.categoria_id = categoria_id;
	}


	@Override
	public String toString() {
		return "productos [id=" + id + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio=" + precio
				+ ", cantidad=" + cantidad + ", categoria_id=" + categoria_id + "]";
	}
    
    
}
