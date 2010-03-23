package br.ufpe.cin.reuso.model.business.register;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.model.business.entities.Publicacao;
import br.ufpe.cin.reuso.model.persistence.dao.impl.PublicacaoDAO;
import br.ufpe.cin.reuso.model.persistence.interfaces.IRegister;

public class RegisterPublicacao {
	
	private static RegisterPublicacao registerPublicacao = null;

    private IRegister<Publicacao> iRegister = null;

    public static RegisterPublicacao getInstance()
    {
        if (registerPublicacao == null)
        {
            registerPublicacao = new RegisterPublicacao();
        }
        return registerPublicacao;
    }
    
    private RegisterPublicacao()
    {
        iRegister = PublicacaoDAO.getInstance();
    }
    
    public boolean inserir(Object publicacao){
    	boolean retorno = true;
		try {
			iRegister.begin();
			((Publicacao)publicacao).setId(null);
			iRegister.salvar((Publicacao) publicacao);
			
		} catch (Exception e) {
			retorno = false;
			iRegister.rollback();
			e.printStackTrace();
		} finally {
			iRegister.commit();
			
		}
		return retorno;
    }

	public boolean remover(Publicacao object) {
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

	public Object merge(Publicacao object) {
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
	public List buscarPorExemplo(Publicacao object, Order[] ordenacoes) {
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
