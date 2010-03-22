package br.ufpe.cin.reuso.model.business.entities;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import static javax.persistence.FetchType.EAGER;

@Entity
public class Tipo implements Serializable {
	@Id
	private Integer id;

	private String nome;

	@OneToMany(mappedBy="tipo", fetch = EAGER)
	private Collection<Membro> membroCollection;

	private static final long serialVersionUID = 1L;

	public Tipo() {
		super();
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Collection<Membro> getMembroCollection() {
		return this.membroCollection;
	}

	public void setMembroCollection(Collection<Membro> membroCollection) {
		this.membroCollection = membroCollection;
	}

}
