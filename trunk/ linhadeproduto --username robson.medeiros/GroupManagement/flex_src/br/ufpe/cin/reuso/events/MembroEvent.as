package br.ufpe.cin.reuso.events
{
	import br.ufpe.cin.reuso.vo.MembroVO;
	
	import com.universalmind.cairngorm.events.Callbacks;
	import com.universalmind.cairngorm.events.UMEvent;
	
	import flash.events.Event;


	public class MembroEvent extends UMEvent //extends CairngormEvent
	{
		public static const EVENT_PESQUISAR:String = "PesquisarMembro";
		public static const EVENT_INSERIR:String = "InserirMembro";
		public static const EVENT_EDITAR:String = "EditarMembro";
		public static const EVENT_EXCLUIR:String = "ExcluirMembro";
		public var params:MembroVO = null;
		public var ordernarPor:String = "codigoMembro";


		public function MembroEvent( type:String, callback:Callbacks = null )
		{
			super( type, callback );
		}


		public function setCallbacks( callback:Callbacks ):void
		{
			super.callbacks = callback;
		}


		override public function clone():Event
		{
			return new MembroEvent( this.type ).copyFrom( this );
		}


		override public function copyFrom( ev:Event ):Event
		{
			// copy custom attributes
			if ( ev is MembroEvent )
			{
				this.params = ( ev as MembroEvent ).params;
				this.ordernarPor = ( ev as MembroEvent ).ordernarPor;
			}
			return super.copyFrom( this );
		}


	}
}