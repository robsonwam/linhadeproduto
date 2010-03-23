package br.ufpe.cin.reuso.events
{
	import br.ufpe.cin.reuso.vo.PublicacaoVO;
	
	import com.universalmind.cairngorm.events.Callbacks;
	import com.universalmind.cairngorm.events.UMEvent;
	
	import flash.events.Event;
	
	public class PublicacaoEvent extends UMEvent
	{
		public static const EVENT_PESQUISAR:String = "PesquisarPublicacao";
		public static const EVENT_INSERIR:String = "InserirPublicacao";
		public static const EVENT_EDITAR:String = "EditarPublicacao";
		public static const EVENT_EXCLUIR:String = "ExcluirPublicacao";
		public var params:PublicacaoVO = null;
		public var ordernarPor:String = "id";


		public function PublicacaoEvent( type:String, callback:Callbacks = null )
		{
			super( type, callback );
		}


		public function setCallbacks( callback:Callbacks ):void
		{
			super.callbacks = callback;
		}


		override public function clone():Event
		{
			return new PublicacaoEvent( this.type ).copyFrom( this );
		}


		override public function copyFrom( ev:Event ):Event
		{
			// copy custom attributes
			if ( ev is PublicacaoEvent )
			{
				this.params = ( ev as PublicacaoEvent ).params;
				this.ordernarPor = ( ev as PublicacaoEvent ).ordernarPor;
			}
			return super.copyFrom( this );
		}
	}
}