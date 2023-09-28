package com.farmacia.modelo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "farmacia")
public class farmacia {

	@Id
	@GeneratedValue(strategy = Generationtype.IDENTITY)
	private int idmedicamento;
	private String nombre;
	private String descripcion;
	private String categoria;
	private double precio;
	private int stock;


	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechavencimiento;
	private String proveedor;

public class farmacia {
	public Libro(int id_libro, String titulo, String autor, String editorial, Date fecharegistro, String costo) {
		super();
		this.id_libro = id_libro;
		this.titulo = titulo;
		this.autor = autor;
		this.editorial = editorial;
		this.fecharegistro = fecharegistro;
		this.costo = costo;
	}

	public Libro() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId_libro() {
		return id_libro;
	}

	public void setId_libro(int id_libro) {
		this.id_libro = id_libro;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getEditorial() {
		return editorial;
	}

	public void setEditorial(String editorial) {
		this.editorial = editorial;
	}

	public Date getFecharegistro() {
		return fecharegistro;
	}

	public void setFecharegistro(Date fecharegistro) {
		this.fecharegistro = fecharegistro;
	}

	public String getCosto() {
		return costo;
	}

	public void setCosto(String costo) {
		this.costo = costo;
	}

	@Override
	public String toString() {
		return "Libro [id_libro=" + id_libro + ", titulo=" + titulo + ", autor=" + autor + ", editorial=" + editorial
				+ ", fecharegistro=" + fecharegistro + ", costo=" + costo + "]";
	}

}

}
