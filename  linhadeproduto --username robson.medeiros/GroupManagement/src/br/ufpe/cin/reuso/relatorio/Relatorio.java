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

public class Relatorio extends HttpServlet{
	
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String membroCodigo = request.getParameter("membro");
		RequestDispatcher view = null;
		if(membroCodigo != null){
			 view = request.getRequestDispatcher("Membro.jsp");
			 Membro membro = new Membro();
			 membro.setCodigo(membroCodigo);
			 try {
				membro = (Membro) FacadeReuso.getInstance().buscaPorExemplo(membro, Order.asc("codigo")).get(0);
				membro =(Membro) FacadeReuso.getInstance().buscarPorChave(membro);
			} catch (OperacaoInvalidaException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("membro", membro);
			
		}else{
			view = request.getRequestDispatcher("Relatorio.jsp");
			Tipo tipo = new Tipo();
			List<Tipo> tipos = null;
			try {
				tipos = FacadeReuso.getInstance().buscaPorExemplo(tipo, Order.asc("id"));
			} catch (OperacaoInvalidaException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("tipos", tipos);
		}
		view.forward(request, response);
	}

}
