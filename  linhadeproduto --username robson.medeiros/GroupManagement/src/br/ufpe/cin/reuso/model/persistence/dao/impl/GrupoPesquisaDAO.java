package br.ufpe.cin.reuso.model.persistence.dao.impl;

import br.ufpe.cin.reuso.model.business.entities.GrupoPesquisa;
import br.ufpe.cin.reuso.model.persistence.dao.GenericDAO;

@SuppressWarnings("unchecked")
public class GrupoPesquisaDAO extends GenericDAO<GrupoPesquisa> {
	
private static GrupoPesquisaDAO grupoPesquisaDAO = null;
	
	public static GrupoPesquisaDAO getInstance()
	{
		if (grupoPesquisaDAO == null)
		{
			grupoPesquisaDAO = new GrupoPesquisaDAO();
		}
		return grupoPesquisaDAO;
	}
	
	protected GrupoPesquisaDAO() {
		super(GrupoPesquisa.class);
	}
	
}
