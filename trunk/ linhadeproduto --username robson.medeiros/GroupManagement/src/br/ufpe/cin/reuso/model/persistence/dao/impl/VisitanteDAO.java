package br.ufpe.cin.reuso.model.persistence.dao.impl;

import br.ufpe.cin.reuso.model.business.entities.Visitante;
import br.ufpe.cin.reuso.model.persistence.dao.GenericDAO;

@SuppressWarnings("unchecked")
public class VisitanteDAO extends GenericDAO<Visitante> {
	
private static VisitanteDAO visitanteDAO = null;
	
	public static VisitanteDAO getInstance()
	{
		if (visitanteDAO == null)
		{
			visitanteDAO = new VisitanteDAO();
		}
		return visitanteDAO;
	}
	
	protected VisitanteDAO() {
		super(Visitante.class);
	}
	
}
