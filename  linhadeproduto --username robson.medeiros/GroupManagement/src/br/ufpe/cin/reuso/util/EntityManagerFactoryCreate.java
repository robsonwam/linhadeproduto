package br.ufpe.cin.reuso.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerFactoryCreate {
	private EntityManager em = null;
	private EntityManagerFactory emf = null;
	private static EntityManagerFactoryCreate entityManagerFactoryCreate = null;

	public static EntityManagerFactoryCreate getInstance() {
		if (entityManagerFactoryCreate == null) {
			entityManagerFactoryCreate = new EntityManagerFactoryCreate();
		}
		return entityManagerFactoryCreate;
	}

	private EntityManagerFactoryCreate() {
		emf = Persistence.createEntityManagerFactory("SaudeResidencia");
		em = emf.createEntityManager();

	}

	public EntityManager getEm() {
		return em;
	}

	public EntityManagerFactory getEmf() {
		return emf;
	}

}
