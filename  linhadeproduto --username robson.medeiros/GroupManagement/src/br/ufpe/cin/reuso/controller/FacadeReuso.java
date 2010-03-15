package br.ufpe.cin.reuso.controller;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.exceptions.ExclusaoInvalidaException;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Login;
import br.ufpe.cin.reuso.model.business.entities.Membro;


public class FacadeReuso {
	
	private static FacadeReuso instance = null;

    private ControllerReuso controllerMREscola = null;
    
    public static FacadeReuso getInstance()
    {
        if (instance == null)
        {
            instance = new FacadeReuso();
        }
        return instance;
    }
    
    private FacadeReuso()
    {
        this.controllerMREscola = ControllerReuso.getInstance();
    }
    
    public boolean inserir(Object object) throws OperacaoInvalidaException{
    	return this.controllerMREscola.inserir(object);
    }
    
    public boolean remover(Object object) throws OperacaoInvalidaException, ExclusaoInvalidaException
    {
    	return this.controllerMREscola.remover(object);
    }
    
    public Object merge(Object objeto) throws OperacaoInvalidaException {
		return this.controllerMREscola.merge(objeto);
    	
    }
    
    public Object buscarPorChave(Object chave) throws OperacaoInvalidaException {
		return this.controllerMREscola.buscarPorChave(chave);
    	
    }
    
    @SuppressWarnings("unchecked")
	public List buscaPorExemplo(Object objeto, Order... ordenacoes) throws OperacaoInvalidaException{
    	return this.controllerMREscola.buscaPorExemplo(objeto, ordenacoes);
    }
    
    public Membro logar(Login login){
    	return this.controllerMREscola.logar(login);
    }
    
}
