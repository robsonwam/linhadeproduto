package br.ufpe.cin.reuso.relatorio;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Order;

import br.ufpe.cin.reuso.controller.FacadeReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;

public class Arquivo extends HttpServlet{
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		this.doGet(request, response);
	}
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("application/pdf");
		String  id = request.getParameter("id"); 
		Publicacao publicacao = new Publicacao();
		publicacao.setId(Integer.parseInt(id));
		try {
			publicacao = (Publicacao) FacadeReuso.getInstance().buscaPorExemplo(publicacao, Order.asc("id")).get(0);
		} catch (OperacaoInvalidaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] arquivoBytes = publicacao.getArquivo();
		if (arquivoBytes != null) {  
			OutputStream outputStream = response.getOutputStream();  
			outputStream.write(arquivoBytes);  
			outputStream.close();  
		}  
	}
}
