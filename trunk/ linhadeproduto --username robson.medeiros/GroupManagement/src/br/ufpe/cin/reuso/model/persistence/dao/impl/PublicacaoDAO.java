package br.ufpe.cin.reuso.model.persistence.dao.impl;

import br.ufpe.cin.reuso.model.business.entities.Publicacao;
import br.ufpe.cin.reuso.model.persistence.dao.GenericDAO;

@SuppressWarnings("unchecked")
public class PublicacaoDAO extends GenericDAO<Publicacao> {
	
private static PublicacaoDAO publicacaoDAO = null;
	
	public static PublicacaoDAO getInstance()
	{
		if (publicacaoDAO == null)
		{
			publicacaoDAO = new PublicacaoDAO();
		}
		return publicacaoDAO;
	}
	
	protected PublicacaoDAO() {
		super(Publicacao.class);
	}
	
}
