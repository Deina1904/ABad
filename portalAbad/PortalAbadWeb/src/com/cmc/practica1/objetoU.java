package com.cmc.practica1;

public class objetoU {
	
	public String nombre;
	public String apellido;
	public String numero;
	public String correo;
	
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	@Override
	public String toString() {
		return "objetoU [nombre=" + nombre + ", apellido=" + apellido + ", numero=" + numero + ", correo=" + correo
				+ "]";
	}
	

	
	
	

}
