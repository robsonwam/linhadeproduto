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

public class Foto extends HttpServlet{
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		this.doGet(request, response);
	}
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("image/jpeg");
		String  id = request.getParameter("id"); 
		Membro membro = new Membro();
		membro.setCodigo(id);
		try {
			membro = (Membro) FacadeReuso.getInstance().buscaPorExemplo(membro, Order.asc("codigo")).get(0);
		} catch (OperacaoInvalidaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		byte[] fotoBytes = membro.getFotoByte();
		if (fotoBytes != null) {  
			OutputStream outputStream = response.getOutputStream();  
			outputStream.write(fotoBytes);  
			outputStream.close();  
		}  
	}
}
