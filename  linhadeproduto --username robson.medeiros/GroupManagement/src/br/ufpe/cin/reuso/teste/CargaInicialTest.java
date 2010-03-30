package br.ufpe.cin.reuso.teste;

import java.util.ArrayList;
import java.util.Collection;

import org.junit.Test;

import br.ufpe.cin.reuso.controller.FacadeReuso;
import br.ufpe.cin.reuso.exceptions.OperacaoInvalidaException;
import br.ufpe.cin.reuso.model.business.entities.Membro;
import br.ufpe.cin.reuso.model.business.entities.Publicacao;
import br.ufpe.cin.reuso.model.business.entities.Tipo;

public class CargaInicialTest {
	
	@Test
	public void cargaInicialMembro() throws OperacaoInvalidaException{
		Membro membro = new Membro();
		membro.setAtivo("Ativo");
		membro.setCidade("Recife");
		membro.setNome("Robson");
		membro.setCodigo("rwam");
		membro.setPasswd("1234");
		
		Tipo tipo = new Tipo();
		tipo.setId(1);
		tipo = (Tipo) FacadeReuso.getInstance().buscarPorChave(tipo);
		
		membro.setTipo(tipo);
		FacadeReuso.getInstance().inserir(membro);
	}
	
	@Test
	public void cargaInicialPublicacao() throws OperacaoInvalidaException{
		Publicacao publicacao = new Publicacao();
		publicacao.setAno(2000);
		publicacao.setTitle("Teste");
		Collection<Membro> membros = new ArrayList<Membro>();
		Membro membro = new Membro();
		membro.setIdMembro(1);
		membro = (Membro) FacadeReuso.getInstance().buscarPorChave(membro);
		membros.add(membro);
		publicacao.setMembroCollection(membros);
		FacadeReuso.getInstance().inserir(publicacao);
	}

}