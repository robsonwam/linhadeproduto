package br.ufpe.cin.reuso.model.business.entities;
import static javax.persistence.CascadeType.ALL;
import static javax.persistence.FetchType.EAGER;
import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Visitante implements Serializable {
	@Id
	@GeneratedValue(strategy=IDENTITY)
	private Integer id;

	private String nome;

	private Date dia;

	private String hora;

	@OneToMany(mappedBy="idVisitante", cascade = ALL, fetch = EAGER)
	private Set<Cronograma> cronogramaCollection;

	private static final long serialVersionUID = 1L;

	public Visitante() {
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

	public Date getDia() {
		return this.dia;
	}

	public void setDia(Date dia) {
		this.dia = dia;
	}

	public String getHora() {
		return this.hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public Set<Cronograma> getCronogramaCollection() {
		return this.cronogramaCollection;
	}

	public void setCronogramaCollection(Set<Cronograma> cronogramaCollection) {
		this.cronogramaCollection = cronogramaCollection;
	}

}
