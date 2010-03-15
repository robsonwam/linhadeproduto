package br.ufpe.cin.reuso.model.business.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Membro implements Serializable {
	@Id
	private String codigo;

	private String passwd;

	private String nome;

	private String tipo;

	private String departamento;

	private String email;

	private String telefone;

	private String website;

	private String cidade;

	private byte[] foto;

	private String ativo;

	@ManyToOne
	@JoinColumn(name="orientador")
	private Membro orientador;

	@ManyToOne
	@JoinColumn(name="co_orientador")
	private Membro coOrientador;

	@OneToMany(mappedBy="orientador")
	private Collection<Membro> orientadorCollection;

	@OneToMany(mappedBy="coOrientador")
	private Collection<Membro> coOrientadorCollection;

	@ManyToMany
	@JoinTable(name="autor",
		joinColumns=@JoinColumn(name="codigo"),
		inverseJoinColumns=@JoinColumn(name="id"))
	private Collection<Publicacao> publicacaoCollection;

	private static final long serialVersionUID = 1L;

	public Membro() {
		super();
	}

	public String getCodigo() {
		return this.codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDepartamento() {
		return this.departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public byte[] getFoto() {
		return this.foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public String getAtivo() {
		return this.ativo;
	}

	public void setAtivo(String ativo) {
		this.ativo = ativo;
	}

	public Membro getOrientador() {
		return this.orientador;
	}

	public void setOrientador(Membro orientador) {
		this.orientador = orientador;
	}

	public Membro getCoOrientador() {
		return this.coOrientador;
	}

	public void setCoOrientador(Membro coOrientador) {
		this.coOrientador = coOrientador;
	}

	public Collection<Membro> getMembroCollection() {
		return this.orientadorCollection;
	}

	public void setMembroCollection(Collection<Membro> membroCollection) {
		this.orientadorCollection = membroCollection;
	}

	public Collection<Membro> getMembroCollection2() {
		return this.coOrientadorCollection;
	}

	public void setMembroCollection2(Collection<Membro> membroCollection2) {
		this.coOrientadorCollection = membroCollection2;
	}

	public Collection<Publicacao> getPublicacaoCollection() {
		return this.publicacaoCollection;
	}

	public void setPublicacaoCollection(Collection<Publicacao> publicacaoCollection) {
		this.publicacaoCollection = publicacaoCollection;
	}

}
