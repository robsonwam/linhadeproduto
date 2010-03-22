package br.ufpe.cin.reuso.model.business.register;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.model.business.entities.Tipo;
import br.ufpe.cin.reuso.model.persistence.dao.impl.TipoDAO;
import br.ufpe.cin.reuso.model.persistence.interfaces.IRegister;

public class RegisterTipo {
	private static RegisterTipo registerTipo = null;

    private IRegister<Tipo> iRegister = null;

    public static RegisterTipo getInstance()
    {
        if (registerTipo == null)
        {
            registerTipo = new RegisterTipo();
        }
        return registerTipo;
    }
    
    private RegisterTipo()
    {
        iRegister = TipoDAO.getInstance();
    }
    
    public boolean inserir(Object tipo){
    	boolean retorno = true;
		try {
			iRegister.begin();
			iRegister.salvar((Tipo) tipo);
			
		} catch (Exception e) {
			retorno = false;
			iRegister.rollback();
			e.printStackTrace();
		} finally {
			iRegister.commit();
			
		}
		return retorno;
    }

	public boolean remover(Tipo object) {
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

	public Object merge(Tipo object) {
		Object retorno = null;
		iRegister.begin();
		retorno = iRegister.merge(object);
		iRegister.commit();
		return retorno;
	}

	public Object buscarPorChave(Integer integer) {
		return iRegister.buscarPorChave(integer);
	}

	@SuppressWarnings("unchecked")
	public List buscarPorExemplo(Tipo object, Order[] ordenacoes) {
		return iRegister.buscarPorExemplo(object, ordenacoes);
	}
}
