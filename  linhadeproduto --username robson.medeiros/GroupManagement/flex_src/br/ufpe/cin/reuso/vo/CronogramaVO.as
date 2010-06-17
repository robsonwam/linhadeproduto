package br.ufpe.cin.reuso.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass( alias="br.ufpe.cin.reuso.model.business.entities.Cronograma" )]
	public class CronogramaVO
	{
		public var id:int;
		public var descricao:String;
		public var dia:String;
		public var hora:String;
		public var idVisitante:VisitanteVO;
		
		public function toString():String
		{
			return this.descricao;
		}
	}
}
