package br.ufpe.cin.reuso.events
{
	import br.ufpe.cin.reuso.vo.TipoVO;
	
	import com.universalmind.cairngorm.events.Callbacks;
	import com.universalmind.cairngorm.events.UMEvent;
	
	import flash.events.Event;


	public class TipoEvent extends UMEvent //extends CairngormEvent
	{
		public static const EVENT_PESQUISAR:String = "PesquisarTipo";
		public static const EVENT_INSERIR:String = "InserirTipo";
		public static const EVENT_EDITAR:String = "EditarTipo";
		public static const EVENT_EXCLUIR:String = "ExcluirTipo";
		public var params:TipoVO = null;
		public var ordernarPor:String = "id";


		public function TipoEvent( type:String, callback:Callbacks = null )
		{
			super( type, callback );
		}


		public function setCallbacks( callback:Callbacks ):void
		{
			super.callbacks = callback;
		}


		override public function clone():Event
		{
			return new TipoEvent( this.type ).copyFrom( this );
		}


		override public function copyFrom( ev:Event ):Event
		{
			// copy custom attributes
			if ( ev is TipoEvent )
			{
				this.params = ( ev as TipoEvent ).params;
				this.ordernarPor = ( ev as TipoEvent ).ordernarPor;
			}
			return super.copyFrom( this );
		}


	}
}