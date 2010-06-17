package br.ufpe.cin.reuso.model.business.register;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.model.business.entities.Cronograma;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;
import br.ufpe.cin.reuso.model.business.entities.Visitante;
import br.ufpe.cin.reuso.model.persistence.dao.impl.VisitanteDAO;
import br.ufpe.cin.reuso.model.persistence.interfaces.IRegister;

public class RegisterVisitante {
	private static RegisterVisitante registerVisitante = null;

    private IRegister<Visitante> iRegister = null;

    public static RegisterVisitante getInstance()
    {
        if (registerVisitante == null)
        {
            registerVisitante = new RegisterVisitante();
        }
        return registerVisitante;
    }
    
    private RegisterVisitante()
    {
        iRegister = VisitanteDAO.getInstance();
    }
    
    public boolean inserir(Object visitante){
    	boolean retorno = true;
		try {
			iRegister.begin();
			((Visitante)visitante).setId(null);
			if(((Visitante) visitante).getCronogramaCollection() != null){
				for (Cronograma cronograma : ((Visitante) visitante).getCronogramaCollection()) {
					cronograma.setId(null);
					cronograma.setIdVisitante((Visitante) visitante);
				}
			}
			iRegister.salvar((Visitante) visitante);
			
		} catch (Exception e) {
			retorno = false;
			iRegister.rollback();
			e.printStackTrace();
		} finally {
			iRegister.commit();
			
		}
		return retorno;
    }

	public boolean remover(Visitante object) {
		boolean retorno = true;
		
		try{
			iRegister.begin();
			iRegister.remover(object);
		}catch (Exception e) {
			retorno = false;
			iRegister.rollback();
			e.printStackTrace();
		} finally {
			iRegister.commit();
		}
		
		return retorno;
	}

	public Object merge(Visitante object) {
		Object retorno = null;
		if(((Visitante) object).getCronogramaCollection() != null){
			for (Cronograma cronograma : ((Visitante) object).getCronogramaCollection()) {
				if(cronograma.getId().equals(0)){
					cronograma.setId(null);
					cronograma.setIdVisitante(object);
					
				}
			}
		}
		iRegister.begin();
		retorno = iRegister.merge(object);
		iRegister.commit();
		return retorno;
	}

	public Object buscarPorChave(Integer integer) {
		return iRegister.buscarPorChave(integer);
	}

	@SuppressWarnings("unchecked")
	public List buscarPorExemplo(Visitante object, Order[] ordenacoes) {
		return iRegister.buscarPorExemplo(object, ordenacoes);
	}
}
