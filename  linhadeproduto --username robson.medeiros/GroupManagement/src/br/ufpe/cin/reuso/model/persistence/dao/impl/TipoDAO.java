package br.ufpe.cin.reuso.model.persistence.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.entities.Tipo;
import br.ufpe.cin.reuso.model.persistence.dao.GenericDAO;

@SuppressWarnings("unchecked")
public class TipoDAO extends GenericDAO<Tipo> {

	private static TipoDAO tipoDAO = null;
	
	public static TipoDAO getInstance()
	{
		if (tipoDAO == null)
		{
			tipoDAO = new TipoDAO();
		}
		return tipoDAO;
	}
	
	public List buscarPorExemplo(Tipo objeto, Order... ordenacoes) {
		Session session = (Session) getEntityManager().getDelegate();
		session.setCacheMode(CacheMode.REFRESH);
		Example example = criaExemplo(objeto);
		Criteria criteria = session.createCriteria(objeto.getClass()).add(
				example);
		for (int i = 0; i < ordenacoes.length; i++) {
			criteria.addOrder((org.hibernate.criterion.Order) ordenacoes[i]);
		}
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Tipo> tipos = criteria.list();
		List<Tipo> tiposTmp = new ArrayList<Tipo>();
		for (Tipo tipo : tipos) {
			Membro membro = new Membro();
			membro.setTipo(tipo);
			tipo.setMembroCollection(null);
			tipo.setMembroCollection(MembroDAO.getInstance().buscarPorExemplo(membro, Order.asc("codigo")));
			tiposTmp.add(tipo);
		}
		return tiposTmp;
	}
	
	protected TipoDAO() {
		super(Tipo.class);
	}

}
