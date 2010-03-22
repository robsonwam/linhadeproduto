package br.ufpe.cin.reuso.business
{
	import br.ufpe.cin.reuso.vo.TipoVO;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	public class AmbulanciaDelegate // extends Delegate
	{
		private var responder:IResponder;
		private var service:Object;

		public function TipoDelegate( responder:IResponder )
		{
			this.service = ServiceLocator.getInstance().getRemoteObject( ReusoModelLocator.SERVICES_LOCATION );
			this.responder = responder;
		}

		public function Inserir( params:TipoVO ):void
		{
			var token:AsyncToken = this.service.inserir( params );
			token.addResponder( responder );
		}

		public function Excluir( params:TipoVO ):void
		{
			var token:AsyncToken = this.service.remover( params );
			token.addResponder( responder );
		}

		public function Editar( params:TipoVO ):void
		{
			var token:AsyncToken = this.service.atualizar( params );
			token.addResponder( responder );
		}

		public function Pesquisar( params:TipoVO, ordernarPor:String ):void
		{
			var token:AsyncToken = this.service.buscaPorExemplo( params, ordernarPor );
			token.addResponder( responder );
		}
	}
}