package br.ufpe.cin.reuso.relatorio;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;

public class MudaLinguaServlet extends HttpServlet {
	  @Override
	  protected void service(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		  	RequestDispatcher view = request.getRequestDispatcher("frame.html");
	        String language = request.getParameter("lingua");
	        Locale locale = new Locale(language);

	        Config.set(request.getSession(), Config.FMT_LOCALE, locale);
	        Config.set(request.getSession(), Config.FMT_FALLBACK_LOCALE, locale);

	        
//	        response.sendRedirect("frame.html");
	        view.forward(request, response);
	  }

}