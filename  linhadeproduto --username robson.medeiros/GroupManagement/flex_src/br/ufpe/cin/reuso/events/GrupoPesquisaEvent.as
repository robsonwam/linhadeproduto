package br.ufpe.cin.reuso.events
{
	import br.ufpe.cin.reuso.vo.GrupoPesquisaVO;
	
	import com.universalmind.cairngorm.events.Callbacks;
	import com.universalmind.cairngorm.events.UMEvent;
	
	import flash.events.Event;
	
	public class GrupoPesquisaEvent extends UMEvent
	{
		public static const EVENT_PESQUISAR:String = "PesquisarGrupoPesquisa";
		public static const EVENT_INSERIR:String = "InserirGrupoPesquisa";
		public static const EVENT_EDITAR:String = "EditarGrupoPesquisa";
		public static const EVENT_EXCLUIR:String = "ExcluirGrupoPesquisa";
		public var params:GrupoPesquisaVO = null;
		public var ordernarPor:String = "id";


		public function GrupoPesquisaEvent( type:String, callback:Callbacks = null )
		{
			super( type, callback );
		}


		public function setCallbacks( callback:Callbacks ):void
		{
			super.callbacks = callback;
		}


		override public function clone():Event
		{
			return new GrupoPesquisaEvent( this.type ).copyFrom( this );
		}


		override public function copyFrom( ev:Event ):Event
		{
			// copy custom attributes
			if ( ev is GrupoPesquisaEvent )
			{
				this.params = ( ev as GrupoPesquisaEvent ).params;
				this.ordernarPor = ( ev as GrupoPesquisaEvent ).ordernarPor;
			}
			return super.copyFrom( this );
		}
	}
}