package br.ufpe.cin.reuso.util
{
	import br.com.r2jm.sauderesidencia.controller.FacadeSaudeResidencia;
	import br.com.r2jm.sauderesidencia.vo.Funcionario;
	import br.com.r2jm.sauderesidencia.vo.Login;
	import br.com.r2jm.sauderesidencia.remote.RemoteConection;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.*;

	[Bindable]
	public class Autenticacao
	{
		private static var _instance:Autenticacao = null;
		private var usuario:Funcionario = null;
		private const ERROR_AUTENTICACAO:String = "Falha na autênticação.";

		public static function getInstance():Autenticacao
		{
			if ( _instance == null )
				_instance = new Autenticacao( arguments.callee );
			return _instance;
		}

		public function Autenticacao( caller:Function = null )
		{
			if ( caller != Autenticacao.getInstance )
				throw new Error( "Facade is a singleton class, use getInstance() instead" );

			if ( Autenticacao._instance != null )
				throw new Error( "Only one Facade instance should be instantiated" );

			this.usuario = null;
		}

		private function validarLogin( login:Login ):Boolean
		{

			if ( login.usuario.length <= 0 )
			{
				Alert.show( "Favor informar o número da mátricula.", this.ERROR_AUTENTICACAO );
				return false;
			}

			if ( login.senha.length <= 0 )
			{
				Alert.show( "Favor informar a senha.", this.ERROR_AUTENTICACAO );
				return false;
			}

			if (( login.senha.length > 0 ) && ( login.senha.length < 6 ))
			{
				Alert.show( "Favor informar a senha com 6 digitos.", this.ERROR_AUTENTICACAO );
				return false;
			}

			return true;
		}

		private function autorizaAcesso( event:ResultEvent ):void
		{
			this.usuario = ( event.result as Funcionario );

			if ( this.usuario == null )
				Alert.show( "Usuário não encontrado.", this.ERROR_AUTENTICACAO );
			//  throw new Error(this.ERROR_AUTENTICACAO);
		}

		public function doLogin( login:Login ):Boolean
		{
			if ( validarLogin( login ))
			{
				var facade:FacadeSaudeResidencia = FacadeSaudeResidencia.getInstance() as FacadeSaudeResidencia;
				( facade.getRemoteObjectConection() as RemoteConection ).call( "doLogin", login, null, this.autorizaAcesso );
				return Boolean(( this.usuario != null ));
			}
			return false;
		}

		public function getUser():Funcionario
		{
			return this.usuario;
		}

		public function isLogado():Boolean
		{
			return Boolean(( this.usuario != null ));
		}

		public function logout():Boolean
		{
			this.usuario = null;
			return Boolean( this.usuario == null );
		}
	}
}