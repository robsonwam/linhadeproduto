package br.ufpe.cin.reuso.controller;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.exceptions.ExclusaoInvalidaException;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Login;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.entities.Tipo;
import br.ufpe.cin.reuso.model.business.register.RegisterMembro;
import br.ufpe.cin.reuso.model.business.register.RegisterTipo;


public class ControllerReuso {

	private RegisterMembro registerMembro = null;
	private RegisterTipo registerTipo = null;
	

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
		else if (object instanceof Tipo)
		{
			return registerTipo.inserir((Tipo)object);
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
		else if (object instanceof Tipo)
		{
			return registerTipo.remover((Tipo)object);
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
		else if (object instanceof Tipo)
		{
			return registerTipo.merge((Tipo)object);
		}
		else
		{
			throw new OperacaoInvalidaException();
		}
		
	}
	
	public Object buscarPorChave(Object object) throws OperacaoInvalidaException {
		if (object instanceof Membro)
		{
			return registerMembro.buscarPorChave(((Membro)object).getIdMembro());
		}
		else if (object instanceof Tipo)
		{
			return registerTipo.buscarPorChave(((Tipo)object).getId());
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
			if(((Membro)object).getIdMembro() == null || ((Membro)object).getIdMembro() == 0)
			{
				return registerMembro.buscarPorExemplo((Membro)object,ordenacoes);
			} else {
				List result = new ArrayList();
				Object element = registerMembro.buscarPorChave(((Membro)object).getIdMembro());
				if(element != null){
					result.add(element);
				}
				return result;
			}
			
		}
		else if (object instanceof Tipo)
		{
			if(((Tipo)object).getId() == null || ((Tipo)object).getId() == 0)
			{
				return registerTipo.buscarPorExemplo((Tipo)object,ordenacoes);
			} else {
				List result = new ArrayList();
				Object element = registerTipo.buscarPorChave(((Tipo)object).getId());
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
		registerTipo = RegisterTipo.getInstance();
    }



}
