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

@Entity
public class Membro implements Serializable {
	@Id
	@Column(name="id_membro")
	@GeneratedValue(strategy=IDENTITY)
	private Integer idMembro;

	private String codigo;

	private String passwd;

	private String nome;

	@Column(name="tipo_estudante")
	private String tipoEstudante;

	private String departamento;

	private String email;

	private String telefone;

	private String website;

	private String cidade;

	private String foto;
	
	@ManyToOne
	@JoinColumn(name="id_grupo_pesquisa")
	private GrupoPesquisa grupoPesquisa;

	@Column(name="foto_byte")
	private byte[] fotoByte;

	private String ativo;

	private String orientador;

	@Column(name="co_orientador")
	private String coOrientador;

	@ManyToOne
	@JoinColumn(name="tipo")
	private Tipo tipo;

	@ManyToMany
	@JoinTable(name="autor",
		joinColumns=@JoinColumn(name="id_membro"),
		inverseJoinColumns=@JoinColumn(name="id"))
	private Collection<Publicacao> publicacaoCollection;

	private static final long serialVersionUID = 1L;

	public Membro() {
		super();
	}

	public Integer getIdMembro() {
		return this.idMembro;
	}

	public void setIdMembro(Integer idMembro) {
		this.idMembro = idMembro;
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

	public String getTipoEstudante() {
		return this.tipoEstudante;
	}

	public void setTipoEstudante(String tipoEstudante) {
		this.tipoEstudante = tipoEstudante;
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

	public String getFoto() {
		return this.foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public byte[] getFotoByte() {
		return this.fotoByte;
	}

	public void setFotoByte(byte[] fotoByte) {
		this.fotoByte = fotoByte;
	}

	public String getAtivo() {
		return this.ativo;
	}

	public void setAtivo(String ativo) {
		this.ativo = ativo;
	}

	public String getOrientador() {
		return this.orientador;
	}

	public void setOrientador(String orientador) {
		this.orientador = orientador;
	}

	public String getCoOrientador() {
		return this.coOrientador;
	}

	public void setCoOrientador(String coOrientador) {
		this.coOrientador = coOrientador;
	}

	public Tipo getTipo() {
		return this.tipo;
	}

	public void setTipo(Tipo tipo) {
		this.tipo = tipo;
	}

	public Collection<Publicacao> getPublicacaoCollection() {
		return this.publicacaoCollection;
	}

	public void setPublicacaoCollection(Collection<Publicacao> publicacaoCollection) {
		this.publicacaoCollection = publicacaoCollection;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idMembro == null) ? 0 : idMembro.hashCode());
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
		Membro other = (Membro) obj;
		if (idMembro == null) {
			if (other.idMembro != null)
				return false;
		} else if (!idMembro.equals(other.idMembro))
			return false;
		return true;
	}

	public GrupoPesquisa getGrupoPesquisa() {
		return grupoPesquisa;
	}

	public void setGrupoPesquisa(GrupoPesquisa idGrupoPesquisa) {
		this.grupoPesquisa = idGrupoPesquisa;
	}

}
