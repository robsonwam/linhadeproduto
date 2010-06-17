package br.ufpe.cin.reuso.model.business.entities;
import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Cronograma implements Serializable {
	
	@Id
	@GeneratedValue(strategy=IDENTITY)
	private Integer id;

	private String dia;

	private String hora;

	private String descricao;

	@ManyToOne
	@JoinColumn(name="id_visitante")
	private Visitante idVisitante;

	private static final long serialVersionUID = 1L;

	public Cronograma() {
		super();
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDia() {
		return this.dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getHora() {
		return this.hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Visitante getIdVisitante() {
		return idVisitante;
	}

	public void setIdVisitante(Visitante idVisitante) {
		this.idVisitante = idVisitante;
	}

}
