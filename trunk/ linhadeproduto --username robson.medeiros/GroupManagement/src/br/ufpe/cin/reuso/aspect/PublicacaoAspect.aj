package br.ufpe.cin.reuso.aspect;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.controller.ControllerReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;
import br.ufpe.cin.reuso.model.business.register.RegisterPublicacao;

public aspect PublicacaoAspect {

	private RegisterPublicacao registerPublicacao = RegisterPublicacao
			.getInstance();

	pointcut inserir(Publicacao publicacao) : execution (* ControllerReuso.inserir(..)) && args (publicacao);

	Object around(Object publicacao) throws OperacaoInvalidaException : inserir(publicacao) {
		return registerPublicacao.inserir((Publicacao) publicacao);
	}

	pointcut remover(Publicacao publicacao) : execution (* ControllerReuso.remover(..)) && args (publicacao);

	Object around(Object publicacao) throws OperacaoInvalidaException : remover(publicacao) {
		return registerPublicacao.remover((Publicacao) publicacao);
	}

	pointcut merge(Publicacao publicacao) : execution (* ControllerReuso.merge(..)) && args (publicacao);

	Object around(Object publicacao) throws OperacaoInvalidaException : merge(publicacao) {
		return registerPublicacao.merge((Publicacao) publicacao);
	}

	pointcut buscarPorChave(Publicacao publicacao) : execution (* ControllerReuso.buscarPorChave(..)) && args (publicacao);

	Object around(Object publicacao) throws OperacaoInvalidaException : buscarPorChave(publicacao) {
		return registerPublicacao
				.buscarPorChave(((Publicacao) publicacao).getId());
	}

	pointcut buscaPorExemplo(Publicacao publicacao, Order[] order) : execution (* ControllerReuso.buscaPorExemplo(..)) && args (publicacao, order);

	Object around(Object publicacao, Order[] order)
			throws OperacaoInvalidaException : buscaPorExemplo(publicacao, order) {
		if (((Publicacao) publicacao).getId() == null
				|| ((Publicacao) publicacao).getId().toString() == null
				|| ((Publicacao) publicacao).getId() == 0) {
			return registerPublicacao.buscarPorExemplo((Publicacao) publicacao,
					order);
		} else {
			List result = new ArrayList();
			Object element = registerPublicacao
					.buscarPorChave(((Publicacao) publicacao).getId());
			if (element != null) {
				result.add(element);
			}
			return result;
		}
	}
}
