package br.ufpe.cin.reuso.model.business.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Publicacao implements Serializable {
	@Id
	private Integer id;

	private String tipo;

	private byte[] arquivo;

	private String title;

	private String jornal;

	private Integer ano;

	private String volume;

	private Integer numero;

	private Integer pages;

	private String conference;

	private Integer mes;

	private String school;

	@ManyToMany(mappedBy="publicacaoCollection")
	private Collection<Membro> membroCollection;

	private static final long serialVersionUID = 1L;

	public Publicacao() {
		super();
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public byte[] getArquivo() {
		return this.arquivo;
	}

	public void setArquivo(byte[] arquivo) {
		this.arquivo = arquivo;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJornal() {
		return this.jornal;
	}

	public void setJornal(String jornal) {
		this.jornal = jornal;
	}

	public Integer getAno() {
		return this.ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getVolume() {
		return this.volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public Integer getNumero() {
		return this.numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Integer getPages() {
		return this.pages;
	}

	public void setPages(Integer pages) {
		this.pages = pages;
	}

	public String getConference() {
		return this.conference;
	}

	public void setConference(String conference) {
		this.conference = conference;
	}

	public Integer getMes() {
		return this.mes;
	}

	public void setMes(Integer mes) {
		this.mes = mes;
	}

	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public Collection<Membro> getMembroCollection() {
		return this.membroCollection;
	}

	public void setMembroCollection(Collection<Membro> membroCollection) {
		this.membroCollection = membroCollection;
	}

}
