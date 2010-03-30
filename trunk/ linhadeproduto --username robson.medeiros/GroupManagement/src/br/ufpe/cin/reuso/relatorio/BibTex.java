package br.ufpe.cin.reuso.relatorio;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufpe.cin.reuso.controller.FacadeReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;

public class BibTex extends HttpServlet{
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		this.doGet(request, response);
	}
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		response.setContentType("application/text");
		response.addHeader("Content-Disposition", "attachment; filename=bibtex.txt");
		PrintWriter pw = response.getWriter();
		String id = request.getParameter("id");
		Publicacao publicacao = new Publicacao();
		publicacao.setId(Integer.parseInt(id));
		try {
			publicacao =  (Publicacao) FacadeReuso.getInstance().buscarPorChave(publicacao);
		} catch (OperacaoInvalidaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i = 1;
		if(publicacao.getTipo().contains("revista") || publicacao.getTipo().contains("magazine") || publicacao.getTipo().contains("journal" )){
			pw.println("@Article {");
			pw.print("Author = ");
			for (Membro membro : publicacao.getMembroCollection()) {
				pw.print(membro.getNome());
				if(i < publicacao.getMembroCollection().size()){
					pw.print(" and ");
				}
				i++;
			}
			if(publicacao.getAutorExterno() != null && !publicacao.getAutorExterno().equals("")){
				pw.print(" and ");
				pw.println(publicacao.getAutorExterno().replaceAll(",", " and ").replaceAll("\r", " and "));
			}else {
				pw.println();
			}
			pw.println("title = "+publicacao.getTitle());
			pw.println("journal = "+publicacao.getJornal());
			pw.println("year = "+publicacao.getAno());
			if(publicacao.getVolume() != null){
				pw.println("volume = "+publicacao.getVolume());
			}
			
			if(publicacao.getNumero() != null){
				pw.println("number = "+publicacao.getNumero());
			}
			
			if(publicacao.getPages() != null){
				pw.println("pages = "+publicacao.getPages());
			}
			
			pw.print("}");
			
		}
		else if(publicacao.getTipo().contains("conferência")){
			pw.println("@Conference {");
			pw.print("Author = ");
			for (Membro membro : publicacao.getMembroCollection()) {
				pw.print(membro.getNome());
				if(i < publicacao.getMembroCollection().size()){
					pw.print(" and ");
				}
				i++;
			}
			if(publicacao.getAutorExterno() != null && !publicacao.getAutorExterno().equals("")){
				pw.print(" and ");
				pw.println(publicacao.getAutorExterno().replaceAll(",", " and ").replaceAll("\r", " and "));
			}else {
				pw.println();
			}
			pw.println("title = "+publicacao.getTitle());
			pw.println("conference = "+publicacao.getConference());
			pw.println("year = "+publicacao.getAno());
			if(publicacao.getPages() != null){
				pw.println("pages = "+publicacao.getPages());
			}
			
			if(publicacao.getMes() != null){
				pw.println("month = "+publicacao.getMes());
			}
			pw.print("}");
			
		}
		else if(publicacao.getTipo().contains("mestrado") || publicacao.getTipo().contains("master") || publicacao.getTipo().contains("doutorado") || publicacao.getTipo().contains("doctor") || publicacao.getTipo().contains("phd")){
			if(publicacao.getTipo().contains("mestrado") || publicacao.getTipo().contains("master")){
				pw.println("@Mastersthesis {");
			} else {
				pw.println("@Phdthesis {");
			}
			pw.print("Author = ");
			for (Membro membro : publicacao.getMembroCollection()) {
				pw.print(membro.getNome());
				if(i < publicacao.getMembroCollection().size()){
					pw.print(" and ");
				}
				i++;
			}
			if(publicacao.getAutorExterno() != null && !publicacao.getAutorExterno().equals("")){
				pw.print(" and ");
				pw.println(publicacao.getAutorExterno().replaceAll(",", " and ").replaceAll("\r", " and "));
			}else {
				pw.println();
			}
			pw.println("title = "+publicacao.getTitle());
			pw.println("school = "+publicacao.getSchool());
			pw.println("year = "+publicacao.getAno());
			if(publicacao.getMes() != null){
				pw.println("month = "+publicacao.getMes());
			}
			pw.println("}");
			
		}
		pw.flush();
		pw.close();
	}
}
