package br.ufpe.cin.reuso.model.business.entities;

public class Login {

	private String usuario;
	private String senha;

	public Login()
	{
		this.senha = "";
		this.usuario = "";
	}
	
	public Login(String usuario, String senha)
	{
		this.usuario = usuario;
		this.senha = senha;
	}
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
