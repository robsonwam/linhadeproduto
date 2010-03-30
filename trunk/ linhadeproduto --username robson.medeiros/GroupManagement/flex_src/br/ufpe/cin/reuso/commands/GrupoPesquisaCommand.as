package br.ufpe.cin.reuso.commands
{
	import br.ufpe.cin.reuso.delegate.GrupoPesquisaDelegate;
	import br.ufpe.cin.reuso.events.GrupoPesquisaEvent;
	import br.ufpe.cin.reuso.model.ReusoModelLocator;
	import br.ufpe.cin.reuso.util.Dicionario;
	import br.ufpe.cin.reuso.vo.GrupoPesquisaVO;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.universalmind.cairngorm.commands.Command;
	import com.universalmind.cairngorm.events.Callbacks;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.*;
	
	public class GrupoPesquisaCommand extends Command implements IResponder
	{
		private var model:ReusoModelLocator = ReusoModelLocator.getInstance();
		private var eventType:String = "";

		public function GrupoPesquisaCommand()
		{
		}

		/*
		 * Executa os metodos no Delegate e retorna para o metod Result ou Fault
		 */
		override public function execute( event:CairngormEvent ):void
		{
			super.execute( event );
			this.eventType = event.type;
			var handlers:Callbacks = new Callbacks( result, fault );
			var delegate:GrupoPesquisaDelegate = new GrupoPesquisaDelegate( handlers );

			if ( this.eventType == GrupoPesquisaEvent.EVENT_PESQUISAR )
			{
				delegate.Pesquisar(( event as GrupoPesquisaEvent ).params, ( event as GrupoPesquisaEvent ).ordernarPor );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_INSERIR )
			{
				delegate.Inserir(( event as GrupoPesquisaEvent ).params );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_EDITAR )
			{
				delegate.Editar(( event as GrupoPesquisaEvent ).params );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_EXCLUIR )
			{
				delegate.Excluir(( event as GrupoPesquisaEvent ).params );
			}
		}

		/*
		 * verifica quem gerou o evento e trata no metodo correspondente de result
		 */
		override public function result( event:Object ):void
		{
			if ( this.eventType == GrupoPesquisaEvent.EVENT_PESQUISAR )
			{
				resultPequisar( event );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_PESQUISAR )
			{
				resultInserir( event );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_INSERIR )
			{
				resultInserir( event );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_EDITAR )
			{
				resultEditar( event );
			}
			else if ( this.eventType == GrupoPesquisaEvent.EVENT_EXCLUIR )
			{
				resultExcluir( event );
			}
		}

		override public function fault( event:Object ):void
		{
			var fault:FaultEvent = event as FaultEvent;
			//FIXME: hsl melhorar tratamento de exception.
			Alert.show( fault.fault.faultString.split( " : " )[ 1 ]);
		}

		private function resultPequisar( event:Object ):void
		{
			var cl:ArrayCollection = new ArrayCollection();

			if ( event.result != null )
			{
				if ( event.result is GrupoPesquisaVO )
				{
					cl.addItem( event.result as GrupoPesquisaVO );
				}
				else if ( event.result is ArrayCollection )
				{
					cl = event.result as ArrayCollection;
				}
			}
			notifyCaller( cl );
		}

		private function resultInserir( event:Object ):void
		{
			if ( event.result != null )
			{
				if ( event.result is Boolean )
				{
					if (( event.result as Boolean ))
					{
						notifyCaller(( event.result as Boolean ));
					}
					else
					{
						Alert.show( Dicionario.ERROR_INCLUIR, Dicionario.ALERT_TITLE_ERROR );
					}
				}
				else if ( event.result is String )
				{
					Alert.show(( event.result as String ), Dicionario.ALERT_TITLE_ERROR );
				}
			}
			else
			{
				Alert.show( Dicionario.ERROR_INCLUIR, Dicionario.ALERT_TITLE_ERROR );
			}
		}

		private function resultEditar( event:Object ):void
		{
			if ( event.result != null )
			{
				if ( event.result is GrupoPesquisaVO )
				{
					if (( event.result as GrupoPesquisaVO ).id.toString() != "" )
					{
						notifyCaller( true );
					}
					else
					{
						Alert.show( Dicionario.ERROR_EDITAR, Dicionario.ALERT_TITLE_ERROR );
					}
				}
				else if ( event.result is String )
				{
					Alert.show(( event.result as String ), Dicionario.ALERT_TITLE_ERROR );
				}
			}
			else
			{
				Alert.show( Dicionario.ERROR_EDITAR, Dicionario.ALERT_TITLE_ERROR );
			}
		}

		private function resultExcluir( event:Object ):void
		{
			if ( event.result != null )
			{
				if ( event.result is Boolean )
				{
					if (( event.result as Boolean ))
					{
						notifyCaller(( event.result as Boolean ));
					}
					else
					{
						Alert.show( Dicionario.ERROR_EXCLUIR, Dicionario.ALERT_TITLE_ERROR );
					}
				}
				else if ( event.result is String )
				{
					Alert.show(( event.result as String ), Dicionario.ALERT_TITLE_ERROR );
				}
			}
			else
			{
				Alert.show( Dicionario.ERROR_EXCLUIR, Dicionario.ALERT_TITLE_ERROR );
			}
		}
	}


	
}