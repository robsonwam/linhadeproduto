package br.ufpe.cin.reuso.delegate
{
	import br.ufpe.cin.reuso.model.ReusoModelLocator;
	import br.ufpe.cin.reuso.vo.VisitanteVO;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class VisitanteDelegate
	{
		private var responder:IResponder;
		private var service:Object;

		public function VisitanteDelegate( responder:IResponder )
		{
			this.service = ServiceLocator.getInstance().getRemoteObject( ReusoModelLocator.SERVICES_LOCATION );
			this.responder = responder;
		}

		public function Inserir( params:VisitanteVO ):void
		{
			var token:AsyncToken = this.service.inserir( params );
			token.addResponder( responder );
		}

		public function Excluir( params:VisitanteVO ):void
		{
			var token:AsyncToken = this.service.remover( params );
			token.addResponder( responder );
		}

		public function Editar( params:VisitanteVO ):void
		{
			var token:AsyncToken = this.service.atualizar( params );
			token.addResponder( responder );
		}

		public function Pesquisar( params:VisitanteVO, ordernarPor:String ):void
		{
			var token:AsyncToken = this.service.buscaPorExemplo( params, ordernarPor );
			token.addResponder( responder );
		}
	}
}