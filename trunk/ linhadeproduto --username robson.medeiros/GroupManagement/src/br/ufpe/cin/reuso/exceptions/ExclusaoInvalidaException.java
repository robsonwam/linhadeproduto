package br.ufpe.cin.reuso.exceptions;

@SuppressWarnings("serial")
public class ExclusaoInvalidaException extends Exception{
	
	public ExclusaoInvalidaException(){
		super();
	}
	
	public ExclusaoInvalidaException(String mensagem){
		super(mensagem);
	}
}
