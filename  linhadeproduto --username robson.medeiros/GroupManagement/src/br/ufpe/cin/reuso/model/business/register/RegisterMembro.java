package br.ufpe.cin.reuso.model.business.register;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.model.business.entities.Login;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.persistence.dao.impl.MembroDAO;
import br.ufpe.cin.reuso.model.persistence.interfaces.IRegister;

public class RegisterMembro {
	private static RegisterMembro registerMembro = null;

    private IRegister<Membro> iRegister = null;

    public static RegisterMembro getInstance()
    {
        if (registerMembro == null)
        {
            registerMembro = new RegisterMembro();
        }
        return registerMembro;
    }
    
    private RegisterMembro()
    {
        iRegister = MembroDAO.getInstance();
    }
    
    public boolean inserir(Object membro){
    	boolean retorno = true;
		try {
			iRegister.begin();
			iRegister.salvar((Membro) membro);
			
		} catch (Exception e) {
			retorno = false;
			iRegister.rollback();
			e.printStackTrace();
		} finally {
			iRegister.commit();
			
		}
		return retorno;
    }

	public boolean remover(Membro object) {
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

	public Object merge(Membro object) {
		Object retorno = null;
		iRegister.begin();
		retorno = iRegister.merge(object);
		iRegister.commit();
		return retorno;
	}

	public Object buscarPorChave(String string) {
		return iRegister.buscarPorChave(string);
	}

	@SuppressWarnings("unchecked")
	public List buscarPorExemplo(Membro object, Order[] ordenacoes) {
		return iRegister.buscarPorExemplo(object, ordenacoes);
	}
	
	public Membro validaLogin(Login login) {
		Membro membro = null;
		if (login != null && !login.getUsuario().isEmpty()
				&& !login.getSenha().isEmpty()) {
			// iRegister.begin();
			membro = ((MembroDAO) iRegister).validaLogin(login);
			// iRegister.commit();
		}
		return membro;
	}
}
