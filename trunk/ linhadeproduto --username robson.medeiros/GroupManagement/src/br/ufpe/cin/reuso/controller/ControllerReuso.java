package br.ufpe.cin.reuso.controller;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.exceptions.ExclusaoInvalidaException;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Login;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.register.RegisterMembro;


public class ControllerReuso {

	private RegisterMembro registerMembro = null;

	private static ControllerReuso instance = null;
	
	public static ControllerReuso getInstance()
    {
        if (instance == null)
        {
            instance = new ControllerReuso();
        }
        return instance;
    }
	

	public boolean inserir(Object object) throws OperacaoInvalidaException {
		if (object instanceof Membro)
		{
			return registerMembro.inserir((Membro)object);
		}
		else
		{
			throw new OperacaoInvalidaException();
		}
	}
	
	public boolean remover(Object object) throws OperacaoInvalidaException, ExclusaoInvalidaException {
		if (object instanceof Membro)
		{
			return registerMembro.remover((Membro)object);
		}
		else
		{
			throw new OperacaoInvalidaException();
		}
		
	}
	
	public Object merge(Object object) throws OperacaoInvalidaException {
		
		if (object instanceof Membro)
		{
			return registerMembro.merge((Membro)object);
		}
		else
		{
			throw new OperacaoInvalidaException();
		}
		
	}
	
	public Object buscarPorChave(Object object) throws OperacaoInvalidaException {
		if (object instanceof Membro)
		{
			return registerMembro.buscarPorChave(((Membro)object).getCodigo());
		}
		else
		{
			throw new OperacaoInvalidaException();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List buscaPorExemplo(Object object, Order[] ordenacoes) throws OperacaoInvalidaException {
		if (object instanceof Membro)
		{
			if(((Membro)object).getCodigo() == null || ((Membro)object).getCodigo() == "")
			{
				return registerMembro.buscarPorExemplo((Membro)object,ordenacoes);
			} else {
				List result = new ArrayList();
				Object element = registerMembro.buscarPorChave(((Membro)object).getCodigo());
				if(element != null){
					result.add(element);
				}
				return result;
			}
			
		}
		else
		{
			throw new OperacaoInvalidaException();
		}
	}
	
	public Membro logar(Login login){
		
		return registerMembro.validaLogin(login);
	}

	
	private ControllerReuso()
    {
		registerMembro = RegisterMembro.getInstance();
    }



}
