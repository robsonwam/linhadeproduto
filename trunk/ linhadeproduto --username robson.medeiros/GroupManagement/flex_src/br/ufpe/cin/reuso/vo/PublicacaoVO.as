package br.ufpe.cin.reuso.vo
{
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Publicacao" )]
	public class PublicacaoVO
	{
			public var id:int;
			public var tipo:String;
			public var arquivo:ByteArray;		
			public var title:String;		
			public var jornal:String;		
			public var ano:int;		
			public var volume:String;		
			public var numero:int;		
			public var pages:int;		
			public var conference:String;		
			public var mes:int;		
			public var school:String;		
			[ArrayElementType( "br.ufpe.cin.reuso.vo.MembroVO" )]
			public var membroCollection:ArrayCollection;
		}
}
	