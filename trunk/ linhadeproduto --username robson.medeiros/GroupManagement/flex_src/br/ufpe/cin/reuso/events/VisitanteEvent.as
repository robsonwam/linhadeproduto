package br.ufpe.cin.reuso.events
{
	import br.ufpe.cin.reuso.vo.VisitanteVO;
	
	import com.universalmind.cairngorm.events.Callbacks;
	import com.universalmind.cairngorm.events.UMEvent;
	
	import flash.events.Event;
	
	public class VisitanteEvent extends UMEvent
	{
		public static const EVENT_PESQUISAR:String = "PesquisarVisitante";
		public static const EVENT_INSERIR:String = "InserirVisitante";
		public static const EVENT_EDITAR:String = "EditarVisitante";
		public static const EVENT_EXCLUIR:String = "ExcluirVisitante";
		public var params:VisitanteVO = null;
		public var ordernarPor:String = "id";


		public function VisitanteEvent( type:String, callback:Callbacks = null )
		{
			super( type, callback );
		}


		public function setCallbacks( callback:Callbacks ):void
		{
			super.callbacks = callback;
		}


		override public function clone():Event
		{
			return new VisitanteEvent( this.type ).copyFrom( this );
		}


		override public function copyFrom( ev:Event ):Event
		{
			// copy custom attributes
			if ( ev is VisitanteEvent )
			{
				this.params = ( ev as VisitanteEvent ).params;
				this.ordernarPor = ( ev as VisitanteEvent ).ordernarPor;
			}
			return super.copyFrom( this );
		}
	}
}