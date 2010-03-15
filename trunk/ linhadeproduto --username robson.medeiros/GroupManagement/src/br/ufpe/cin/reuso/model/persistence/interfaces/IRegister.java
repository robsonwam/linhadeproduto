package br.ufpe.cin.reuso.model.persistence.interfaces;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.exceptions.ExclusaoInvalidaException;

public interface IRegister<T> {
	
	public void begin();
	
	public void commit();
	
	public void rollback();
	
	public void refresh(T object);
	
	public void flush();
	
	public void clear();
	
	public T merge(T objeto);
	
	public void salvar(T objeto) throws ExclusaoInvalidaException;
	
	public void remover(T objeto);
	
	public void removerPorChave(Integer chave);
	
	public T buscarPorChave(Object sala);
	
	public List<T> buscarPorExemplo(T objeto, Order... ordenacoes);
	
	public List<T> buscarPorExemplo(T objeto, Integer indiceInicial,
			Integer indiceFinal, Order... ordenacoes);
	
	public int buscaQuantidadeTotal();
	
	public List<T> buscarTodos(Order... ordenacoes);
	
	public List<T> buscarTodos(Integer indiceInicial, Integer indiceFinal,
			Order... ordenacoes);
	
	public void setEntityManager(EntityManager entityManager);
	
}
