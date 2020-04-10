package com.bibliotheque.Models;

public class Employe {

	private int id_employe  ;
	
	private String nom ;
	
	private String  prenom ;
	
	private String email ;
	
	private String password ;

	
	
	public Employe() {
	
		}



	public Employe(int id_employe, String nom, String prenom, String email, String password) {
		super();
		this.id_employe = id_employe;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.password = password;
	}



	public int getId_employe() {
		return id_employe;
	}



	public void setId_employe(int id_employe) {
		this.id_employe = id_employe;
	}



	public String getNom() {
		return nom;
	}



	public void setNom(String nom) {
		this.nom = nom;
	}



	public String getPrenom() {
		return prenom;
	}



	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
	
}
