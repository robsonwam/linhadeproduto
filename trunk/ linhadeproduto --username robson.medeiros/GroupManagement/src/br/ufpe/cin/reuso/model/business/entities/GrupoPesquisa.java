package br.ufpe.cin.reuso.model.business.entities;
import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="grupo_pesquisa")
public class GrupoPesquisa implements Serializable {
	@Id
	@GeneratedValue(strategy=IDENTITY)
	private Integer id;

	private String descricao;

//	@OneToMany(mappedBy="grupoPesquisa")
	private Collection<Membro> membroCollection;

	@OneToMany(mappedBy="grupoPesquisa")
	private Collection<Publicacao> publicacaoCollection;

	private static final long serialVersionUID = 1L;

	public GrupoPesquisa() {
		super();
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Collection<Membro> getMembroCollection() {
		return this.membroCollection;
	}

	public void setMembroCollection(Collection<Membro> membroCollection) {
		this.membroCollection = membroCollection;
	}

	public Collection<Publicacao> getPublicacaoCollection() {
		return this.publicacaoCollection;
	}

	public void setPublicacaoCollection(Collection<Publicacao> publicacaoCollection) {
		this.publicacaoCollection = publicacaoCollection;
	}

}
