package br.ufpe.cin.reuso.model.business.entities;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class Publicacao implements Serializable {
	@Id
	@GeneratedValue(strategy=IDENTITY)
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
	
	@Transient
	private Boolean hasArquivo; 
	
	@Column(name="autor_externo")
	private String autorExterno;
	
	@ManyToOne
	@JoinColumn(name="id_grupo_pesquisa")
	private GrupoPesquisa grupoPesquisa;

	@ManyToMany
	@JoinTable(name="autor",
		joinColumns=@JoinColumn(name="id"),
		inverseJoinColumns=@JoinColumn(name="id_membro"))
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
		return this.tipo.trim();
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
	
	public Boolean getHasArquivo(){
		boolean retorno = false;
		
		if(this.arquivo != null && this.arquivo.length > 0){
			retorno = true;
		}
		return retorno;
	}

	public void setHasArquivo(Boolean hasArquivo) {
		this.hasArquivo = hasArquivo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Publicacao other = (Publicacao) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public String getAutorExterno() {
		return autorExterno;
	}

	public void setAutorExterno(String autorExterno) {
		this.autorExterno = autorExterno;
	}

	public GrupoPesquisa getGrupoPesquisa() {
		return grupoPesquisa;
	}

	public void setGrupoPesquisa(GrupoPesquisa idGrupoPesquisa) {
		this.grupoPesquisa = idGrupoPesquisa;
	}

}
