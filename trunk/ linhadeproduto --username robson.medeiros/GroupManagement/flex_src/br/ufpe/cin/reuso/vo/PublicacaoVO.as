package br.ufpe.cin.reuso.vo
{
	import flash.utils.ByteArray;

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Publicacao" )]
	public class PublicacaoVO
	{
		public function PublicacaoVO()
		{
			public var id:Integer;
			public var tipo:String;
			public var arquivo:ByteArray;		
			public var title:String;		
			public var jornal:String;		
			public var ano:Integer;		
			public var volume:String;		
			public var numero:String;		
			public var pages:Integer;		
			public var conference:String;		
			public var mes:Integer;		
			public var school:String;		
			[ArrayElementType( "br.ufpe.cin.reuso.vo.MembroVO" )]
			public var membroCollection:ArrayCollection;
		}
	}
}