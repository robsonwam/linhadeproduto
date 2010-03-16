package br.ufpe.cin.reuso.model.persistence.dao.impl;

import javax.persistence.NoResultException;
import javax.persistence.Query;

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
