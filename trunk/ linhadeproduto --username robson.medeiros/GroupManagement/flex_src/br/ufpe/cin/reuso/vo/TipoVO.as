package br.ufpe.cin.reuso.vo
{
	import mx.collections.ArrayCollection;
	

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Tipo" )]
	public class TipoVO
	{
		public var id:int;
		public var nome:String;
		[ArrayElementType( "br.ufpe.cin.reuso.vo.MembroVO" )]
		public var membroCollection:ArrayCollection;
		
		public function toString():String
		{
			return this.nome;
		}
	}
	
}
