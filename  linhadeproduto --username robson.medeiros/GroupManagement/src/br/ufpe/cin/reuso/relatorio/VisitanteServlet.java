package br.ufpe.cin.reuso.relatorio;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.controller.FacadeReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;
import br.ufpe.cin.reuso.model.business.entities.Tipo;
import br.ufpe.cin.reuso.model.business.entities.Visitante;

public class VisitanteServlet extends HttpServlet{
	
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String visitanteId = request.getParameter("id");
		RequestDispatcher view = null;
		if(visitanteId != null){
			 view = request.getRequestDispatcher("Cronograma.jsp");
			 Visitante visitante = new Visitante();
			 visitante.setId(Integer.parseInt(visitanteId));
			 try {
				visitante = (Visitante) FacadeReuso.getInstance().buscaPorExemplo(visitante, Order.asc("id")).get(0);
			} catch (OperacaoInvalidaException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("visitante", visitante);
			
		}else{
			view = request.getRequestDispatcher("Visitante.jsp");
			Visitante visitante = new Visitante();
			List<Visitante> visitantes = null;
			try {
				visitantes = FacadeReuso.getInstance().buscaPorExemplo(visitante, Order.asc("id"));
			} catch (OperacaoInvalidaException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("visitantes", visitantes);
		}
		view.forward(request, response);
	}

}
