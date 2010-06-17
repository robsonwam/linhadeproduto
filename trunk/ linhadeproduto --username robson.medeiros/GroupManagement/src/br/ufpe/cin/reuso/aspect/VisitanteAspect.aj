package br.ufpe.cin.reuso.aspect;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.controller.ControllerReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Visitante;
import br.ufpe.cin.reuso.model.business.register.RegisterVisitante;

public aspect VisitanteAspect {

	private RegisterVisitante registerVisitante = RegisterVisitante
			.getInstance();

	pointcut inserir(Visitante visitante) : execution (* ControllerReuso.inserir(..)) && args (visitante);

	Object around(Object visitante) throws OperacaoInvalidaException : inserir(visitante) {
		return registerVisitante.inserir((Visitante) visitante);
	}

	pointcut remover(Visitante visitante) : execution (* ControllerReuso.remover(..)) && args (visitante);

	Object around(Object visitante) throws OperacaoInvalidaException : remover(visitante) {
		return registerVisitante.remover((Visitante) visitante);
	}

	pointcut merge(Visitante visitante) : execution (* ControllerReuso.merge(..)) && args (visitante);

	Object around(Object visitante) throws OperacaoInvalidaException : merge(visitante) {
		return registerVisitante.merge((Visitante) visitante);
	}

	pointcut buscarPorChave(Visitante visitante) : execution (* ControllerReuso.buscarPorChave(..)) && args (visitante);

	Object around(Object visitante) throws OperacaoInvalidaException : buscarPorChave(visitante) {
		return registerVisitante
				.buscarPorChave(((Visitante) visitante).getId());
	}

	pointcut buscaPorExemplo(Visitante visitante, Order[] order) : execution (* ControllerReuso.buscaPorExemplo(..)) && args (visitante, order);

	Object around(Object visitante, Order[] order)
			throws OperacaoInvalidaException : buscaPorExemplo(visitante, order) {
		if (((Visitante) visitante).getId() == null
				|| ((Visitante) visitante).getId().toString() == null
				|| ((Visitante) visitante).getId() == 0) {
			return registerVisitante.buscarPorExemplo((Visitante) visitante,
					order);
		} else {
			List result = new ArrayList();
			Object element = registerVisitante
					.buscarPorChave(((Visitante) visitante).getId());
			if (element != null) {
				result.add(element);
			}
			return result;
		}
	}
}
