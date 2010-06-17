package br.ufpe.cin.reuso.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Visitante" )]
	public class VisitanteVO
	{
		public var id:int;
		public var nome:String;
		public var dia:Date;
		public var hora:String;
		[ArrayElementType( "br.ufpe.cin.reuso.vo.CronogramaVO" )]
		public var cronogramaCollection:ArrayCollection;
		
		public function toString():String
		{
			return this.nome;
		}
	}
}
