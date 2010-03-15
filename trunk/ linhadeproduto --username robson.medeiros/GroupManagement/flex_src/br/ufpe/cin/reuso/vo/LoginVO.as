package br.ufpe.cin.reuso.vo
{

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Login" )]
	public class LoginVO
	{
		public var usuario:String;
		public var senha:String;
	}
}
