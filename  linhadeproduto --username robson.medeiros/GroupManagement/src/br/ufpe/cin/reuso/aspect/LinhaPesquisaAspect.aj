package br.ufpe.cin.reuso.aspect;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.GrupoPesquisa;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.register.RegisterGrupoPesquisa;
import br.ufpe.cin.reuso.controller.ControllerReuso;

public aspect LinhaPesquisaAspect {
	
	
	declare @field : * GrupoPesquisa.membroCollection : @OneToMany(mappedBy="grupoPesquisa");
	
//	private Collection<Membro> GrupoPesquisa.membroCollection;
	
//	public Collection<Membro> GrupoPesquisa.getMembroCollection() {
//		return this.membroCollection;
//	}
//
//	public void GrupoPesquisa.setMembroCollection(Collection<Membro> membroCollection) {
//		this.membroCollection = membroCollection;
//	}
	
//	declare @field : * Membro.grupoPesquisa : @JoinColumn(name="id_grupo_pesquisa");
//	declare @field : * Membro.grupoPesquisa : @ManyToOne ;
//	private GrupoPesquisa Membro.grupoPesquisa;
//	
//	public GrupoPesquisa Membro.getGrupoPesquisa() {
//		return grupoPesquisa;
//	}
//
//	public void Membro.setGrupoPesquisa(GrupoPesquisa idGrupoPesquisa) {
//		this.grupoPesquisa = idGrupoPesquisa;
//	}
//	
	private RegisterGrupoPesquisa registerGrupoPesquisa = RegisterGrupoPesquisa.getInstance();
	
	pointcut inserir(GrupoPesquisa linhaPesquisa) : execution (* ControllerReuso.inserir(..)) && args (linhaPesquisa);
	
	Object around(Object linhaPesquisa) throws OperacaoInvalidaException : inserir(linhaPesquisa) {
		return registerGrupoPesquisa.inserir((GrupoPesquisa)linhaPesquisa);
	}
	
	pointcut remover(GrupoPesquisa linhaPesquisa) : execution (* ControllerReuso.remover(..)) && args (linhaPesquisa);
	
	Object around(Object linhaPesquisa) throws OperacaoInvalidaException : remover(linhaPesquisa) {
		return registerGrupoPesquisa.remover((GrupoPesquisa)linhaPesquisa);
	}
	
	pointcut merge(GrupoPesquisa linhaPesquisa) : execution (* ControllerReuso.merge(..)) && args (linhaPesquisa);
	
	Object around(Object linhaPesquisa) throws OperacaoInvalidaException : merge(linhaPesquisa) {
		return registerGrupoPesquisa.merge((GrupoPesquisa)linhaPesquisa);
	}
	
	pointcut buscarPorChave(GrupoPesquisa linhaPesquisa) : execution (* ControllerReuso.buscarPorChave(..)) && args (linhaPesquisa);
	
	Object around(Object linhaPesquisa) throws OperacaoInvalidaException : buscarPorChave(linhaPesquisa) {
		return registerGrupoPesquisa.buscarPorChave(((GrupoPesquisa)linhaPesquisa).getId());
	}
	
	pointcut buscaPorExemplo(GrupoPesquisa linhaPesquisa, Order[] order) : execution (* ControllerReuso.buscaPorExemplo(..)) && args (linhaPesquisa, order);
	
	Object around(Object linhaPesquisa, Order[] order) throws OperacaoInvalidaException : buscaPorExemplo(linhaPesquisa, order) {
		if(((GrupoPesquisa)linhaPesquisa).getId() == null || ((GrupoPesquisa)linhaPesquisa).getId().toString() == null || ((GrupoPesquisa)linhaPesquisa).getId() == 0)
		{
			return registerGrupoPesquisa.buscarPorExemplo((GrupoPesquisa)linhaPesquisa,order);
		} else {
			List result = new ArrayList();
			Object element = registerGrupoPesquisa.buscarPorChave(((GrupoPesquisa)linhaPesquisa).getId());
			if(element != null){
				result.add(element);
			}
			return result;
		}
	}
}
