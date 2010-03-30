package br.ufpe.cin.reuso.relatorio;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;

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

public class PublicacaoMembro extends HttpServlet{
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		RequestDispatcher view = request.getRequestDispatcher("PublicacaoMembro.jsp");
		Collection<Membro> membros = null;
		Membro membro = new Membro();
		try {
			membros = FacadeReuso.getInstance().buscaPorExemplo(membro, Order.asc("codigo"));
		} catch (OperacaoInvalidaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("membros", membros);
		
		view.forward(request, response);
	}
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		RequestDispatcher view = request.getRequestDispatcher("Publicacao.jsp");
		String[] membros = request.getParameterValues("membros");
		Collection<Publicacao> publicacoes = new HashSet<Publicacao>();
		try {
			for (String idMembro : membros) {
				Membro membro = new Membro();
				membro.setIdMembro(Integer.parseInt(idMembro));
				
				membro = (Membro) FacadeReuso.getInstance().buscarPorChave(membro);
				for (Publicacao publicacao : membro.getPublicacaoCollection()) {
					if(!publicacoes.contains(publicacao)){
						publicacoes.add(publicacao);
					}
				}
			}
		} catch (OperacaoInvalidaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("publicacoes", publicacoes);
		view.forward(request, response);
	}
	
}
