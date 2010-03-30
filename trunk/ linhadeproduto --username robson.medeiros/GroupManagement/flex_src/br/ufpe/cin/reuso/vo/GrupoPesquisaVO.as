package br.ufpe.cin.reuso.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.GrupoPesquisa" )]
	public class GrupoPesquisaVO
	{
		public var id:int;
		public var descricao:String;
		[ArrayElementType( "br.ufpe.cin.reuso.vo.MembroVO" )]
		public var membroCollection:ArrayCollection;
		[ArrayElementType( "br.ufpe.cin.reuso.vo.PublicacaoVO" )]
		public var publicacaoCollection:ArrayCollection;
		
		public function toString():String
		{
			return this.descricao;
		}
	}
}
