package br.ufpe.cin.reuso.commands
{

	import br.ufpe.cin.reuso.business.LoginDelegate;
	import br.ufpe.cin.reuso.events.LoginEvent;
	import br.ufpe.cin.reuso.model.ReusoModelLocator;
	import br.ufpe.cin.reuso.vo.LoginVO;
	import br.ufpe.cin.reuso.vo.MembroVO;
	import br.ufpe.cin.reuso.vo.UsuarioVO;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.core.Application;
	import mx.rpc.IResponder;
	import mx.rpc.events.*;

	public class LoginCommand implements ICommand, IResponder
	{

		private var modelLocator:ReusoModelLocator = ReusoModelLocator.getInstance();
		private var user:UsuarioVO = null;

		public function LoginCommand()
		{
		}

		public function execute( event:CairngormEvent ):void
		{
			var loginEvent:LoginEvent = event as LoginEvent;
			var delegate:LoginDelegate = new LoginDelegate( this );
			this.user = new UsuarioVO();
			this.user.login = ( loginEvent.login as LoginVO )
			delegate.DoLogin( loginEvent.login as LoginVO );
		}

		public function result( event:Object ):void
		{
			if ( event.result )
			{
				this.user.membro = ( event.result as MembroVO );

				if ( this.user.membro.codigo.toString().length > 0 )
				{
					Application.application.logged( true, this.user, "" );
				}
				else
				{
					Application.application.logged( false, null, "Usuário não encontrado." );
				}
			}
			else
			{
				Application.application.logged( false, null, "Usuário não encontrado." );
			}
		}

		public function fault( event:Object ):void
		{
			trace( "Service Error" );
		}

	}
}