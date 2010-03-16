package br.ufpe.cin.reuso.commands
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.universalmind.cairngorm.commands.Command;
	import com.universalmind.cairngorm.events.Callbacks;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.*;

	public class MembroCommand extends Command implements IResponder //implements ICommand, IResponder
	{
		private var model:ReusoModelLocator = ReusoModelLocator.getInstance();
		private var eventType:String = "";

		public function MembroCommand()
		{
		}

		/*
		 * Executa os metods no Delegate e retorna para o metod Result ou Fault
		 */
		override public function execute( event:CairngormEvent ):void
		{
			super.execute( event );
			this.eventType = event.type;
			var handlers:Callbacks = new Callbacks( result, fault );
			var delegate:MembroDelegate = new MembroDelegate( handlers );

			if ( this.eventType == MembroEvent.EVENT_PESQUISAR )
			{
				delegate.Pesquisar(( event as MembroEvent ).params, ( event as MembroEvent ).ordernarPor );
			}
			else if ( this.eventType == MembroEvent.EVENT_INSERIR )
			{
				delegate.Inserir(( event as MembroEvent ).params );
			}
			else if ( this.eventType == MembroEvent.EVENT_EDITAR )
			{
				delegate.Editar(( event as MembroEvent ).params );
			}
			else if ( this.eventType == MembroEvent.EVENT_EXCLUIR )
			{
				delegate.Excluir(( event as MembroEvent ).params );
			}
		}

		/*
		 * verifica quem gerou o evento e trata no metodo correspondente de result
		 */
		override public function result( event:Object ):void
		{
			if ( this.eventType == MembroEvent.EVENT_PESQUISAR )
			{
				resultPequisar( event );
			}
			else if ( this.eventType == MembroEvent.EVENT_PESQUISAR )
			{
				resultInserir( event );
			}
			else if ( this.eventType == MembroEvent.EVENT_INSERIR )
			{
				resultInserir( event );
			}
			else if ( this.eventType == MembroEvent.EVENT_EDITAR )
			{
				resultEditar( event );
			}
			else if ( this.eventType == MembroEvent.EVENT_EXCLUIR )
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
				if ( event.result is MembroVO )
				{
					cl.addItem( event.result as MembroVO );
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
				if ( event.result is MembroVO )
				{
					if (( event.result as MembroVO ).codigoMembro != "" )
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