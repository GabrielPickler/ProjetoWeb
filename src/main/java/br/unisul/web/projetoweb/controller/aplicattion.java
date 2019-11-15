package br.unisul.web.projetoweb.controller;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class aplicattion {

	public static void main(String[] args) {
		
		EntityManagerFactory emfdb = Persistence.createEntityManagerFactory("persistenciaDisciplina");

	}

}
