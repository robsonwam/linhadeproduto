package br.ufpe.cin.reuso.model.business.register;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.model.business.entities.GrupoPesquisa;
import br.ufpe.cin.reuso.model.persistence.dao.impl.GrupoPesquisaDAO;
import br.ufpe.cin.reuso.model.persistence.interfaces.IRegister;

public class RegisterGrupoPesquisa {
	
	private static RegisterGrupoPesquisa registerGrupoPesquisa = null;

    private IRegister<GrupoPesquisa> iRegister = null;

    public static RegisterGrupoPesquisa getInstance()
    {
        if (registerGrupoPesquisa == null)
        {
            registerGrupoPesquisa = new RegisterGrupoPesquisa();
        }
        return registerGrupoPesquisa;
    }
    
    private RegisterGrupoPesquisa()
    {
        iRegister = GrupoPesquisaDAO.getInstance();
    }
    
    public boolean inserir(Object grupoPesquisa){
    	boolean retorno = true;
		try {
			iRegister.begin();
			((GrupoPesquisa)grupoPesquisa).setId(null);
			iRegister.salvar((GrupoPesquisa) grupoPesquisa);
			
		} catch (Exception e) {
			retorno = false;
			iRegister.rollback();
			e.printStackTrace();
		} finally {
			iRegister.commit();
			
		}
		return retorno;
    }

	public boolean remover(GrupoPesquisa object) {
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

	public Object merge(GrupoPesquisa object) {
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
	public List buscarPorExemplo(GrupoPesquisa object, Order[] ordenacoes) {
		return iRegister.buscarPorExemplo(object, ordenacoes);
	}
	
//	public Membro validaLogin(Login login) {
//		Membro membro = null;
//		if (login != null && !login.getUsuario().isEmpty()
//				&& !login.getSenha().isEmpty()) {
//			// iRegister.begin();
//			membro = ((MembroDAO) iRegister).validaLogin(login);
//			// iRegister.commit();
//		}
//		return membro;
//	}
}
