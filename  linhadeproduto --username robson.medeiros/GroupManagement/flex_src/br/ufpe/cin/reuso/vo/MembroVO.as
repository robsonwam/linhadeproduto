package br.ufpe.cin.reuso.vo
{
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Membro" )]
	public class MembroVO
	{
		
		public var idMembro:int;
		public var codigo:String;
		public var passwd:String;
		public var nome:String;
		public var tipo:TipoVO;
		public var tipoEstudante:String;
		public var departamento:String;
		public var email:String;
		public var telefone:String;
		public var website:String;
		public var cidade:String;
		public var foto:String;
		public var fotoByte:ByteArray;
		public var ativo:String;
		public var orientador:String;
		public var coOrientador:String;
		public var grupoPesquisa:GrupoPesquisaVO;
		[ArrayElementType( "br.ufpe.cin.reuso.vo.PublicacaoVO" )]
		public var publicacaoCollection:ArrayCollection;
	}
}