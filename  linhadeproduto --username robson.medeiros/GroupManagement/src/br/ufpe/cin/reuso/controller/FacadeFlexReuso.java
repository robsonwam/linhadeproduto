package br.ufpe.cin.reuso.controller;

import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.exceptions.ExclusaoInvalidaException;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Login;
import br.ufpe.cin.reuso.model.business.entities.Membro;

public class FacadeFlexReuso {

	public FacadeFlexReuso() {
		// TODO Auto-generated constructor stub
	}

	public FacadeReuso getFacadeSaudeResidencia() {
		return FacadeReuso.getInstance();
	}

	public Membro doLogin(Login login) throws OperacaoInvalidaException{
		return this.getFacadeSaudeResidencia().logar(login);
	}

	public boolean inserir(Object object) throws OperacaoInvalidaException{
		return this.getFacadeSaudeResidencia().inserir(object);
	}

	public boolean remover(Object object) throws OperacaoInvalidaException, ExclusaoInvalidaException
	{
		return this.getFacadeSaudeResidencia().remover(object);
	}

	public Object atualizar(Object objeto) throws OperacaoInvalidaException {
		return this.getFacadeSaudeResidencia().merge(objeto);
	}

	public Object buscarPorChave(Object chave) throws OperacaoInvalidaException {
		return this.getFacadeSaudeResidencia().buscarPorChave(chave);
	}

	@SuppressWarnings("unchecked")
	public List buscaPorExemplo(Object objeto, String atributo) throws OperacaoInvalidaException{
		
		Order ordenacoes = Order.asc(atributo);
		
		return this.getFacadeSaudeResidencia().buscaPorExemplo(objeto, ordenacoes);
	}
}
