package br.ufpe.cin.reuso.delegate
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	public class MembroDelegate // extends Delegate
	{
		private var responder:IResponder;
		private var service:Object;

		public function MembroDelegate( responder:IResponder )
		{
			this.service = ServiceLocator.getInstance().getRemoteObject( ReusoModelLocator.SERVICES_LOCATION );
			this.responder = responder;
		}

		public function Inserir( params:MembroVO ):void
		{
			var token:AsyncToken = this.service.inserir( params );
			token.addResponder( responder );
		}

		public function Excluir( params:MembroVO ):void
		{
			var token:AsyncToken = this.service.remover( params );
			token.addResponder( responder );
		}

		public function Editar( params:MembroVO ):void
		{
			var token:AsyncToken = this.service.atualizar( params );
			token.addResponder( responder );
		}

		public function Pesquisar( params:MembroVO, ordernarPor:String ):void
		{
			var token:AsyncToken = this.service.buscaPorExemplo( params, ordernarPor );
			token.addResponder( responder );
		}
	}
}