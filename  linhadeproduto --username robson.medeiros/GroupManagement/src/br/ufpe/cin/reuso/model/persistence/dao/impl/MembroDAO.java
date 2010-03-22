package br.ufpe.cin.reuso.model.persistence.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.ufpe.cin.reuso.model.business.entities.Login;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.persistence.dao.GenericDAO;

@SuppressWarnings("unchecked")
public class MembroDAO extends GenericDAO<Membro> {

	private static MembroDAO membroDAO = null;
	
	public static MembroDAO getInstance()
	{
		if (membroDAO == null)
		{
			membroDAO = new MembroDAO();
		}
		return membroDAO;
	}
	
	public List buscarPorExemplo(Membro objeto, Order[] ordenacoes) {
		Session session = (Session) getEntityManager().getDelegate();
		Example example = criaExemplo(objeto);
		Criteria criteria = session.createCriteria(objeto.getClass()).add(
				example);
		
		if(objeto.getTipo() != null && objeto.getTipo().getId() != 0){
			criteria.createCriteria("tipo", "tipo");
			criteria.add(Restrictions.eq("tipo.id", objeto.getTipo().getId()));
			
		}
		
		for (int i = 0; i < ordenacoes.length; i++) {
			criteria.addOrder((org.hibernate.criterion.Order) ordenacoes[i]);
		}
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (List) criteria.list();
	}	
	public Membro validaLogin(Login login) {
		Membro membro;
		//Collection<PerfilModulo> perfilModulos;
		try {
		   Query query1 = getEntityManager().createQuery("SELECT m FROM Membro m WHERE m.codigo = :login AND m.passwd = :passwd");
		   
		   query1.setParameter("login", login.getUsuario());
		   query1.setParameter("passwd", login.getSenha());

		   membro = (Membro) query1.getSingleResult();   
		   } catch (NoResultException e) {
		      membro = null;
		   }
		   
		   return membro;
		}
	
	protected MembroDAO() {
		super(Membro.class);
	}

}
