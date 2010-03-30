package br.ufpe.cin.reuso.relatorio;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.controller.FacadeReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;

public class PublicacaoServlet extends HttpServlet{

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		RequestDispatcher view = request.getRequestDispatcher("Publicacao.jsp");
		String title = request.getParameter("title");
		String order = request.getParameter("order");
		Collection<Publicacao> publicacoes = null;
		if(order == null){
			order = "id";
		}
		
		Publicacao publicacao = new Publicacao();
		publicacao.setTitle(title);
		
		try {
			if(order.equals("date")){
				publicacoes = FacadeReuso.getInstance().buscaPorExemplo(publicacao, Order.asc("ano"), Order.asc("mes"));
				
			}else{
				publicacoes = FacadeReuso.getInstance().buscaPorExemplo(publicacao, Order.asc(order));
			}
		} catch (OperacaoInvalidaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("publicacoes", publicacoes);
		request.setAttribute("form", true);
		view.forward(request, response);
	}
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		this.doGet(request, response);
	}
}
