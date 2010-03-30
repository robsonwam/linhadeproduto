package br.ufpe.cin.reuso.business
{
	import br.ufpe.cin.reuso.vo.GrupoPesquisaVO;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class GrupoPesquisaDelegate
	{
		private var responder:IResponder;
		private var service:Object;

		public function GrupoPesquisaDelegate( responder:IResponder )
		{
			this.service = ServiceLocator.getInstance().getRemoteObject( ReusoModelLocator.SERVICES_LOCATION );
			this.responder = responder;
		}

		public function Inserir( params:GrupoPesquisaVO ):void
		{
			var token:AsyncToken = this.service.inserir( params );
			token.addResponder( responder );
		}

		public function Excluir( params:GrupoPesquisaVO ):void
		{
			var token:AsyncToken = this.service.remover( params );
			token.addResponder( responder );
		}

		public function Editar( params:GrupoPesquisaVO ):void
		{
			var token:AsyncToken = this.service.atualizar( params );
			token.addResponder( responder );
		}

		public function Pesquisar( params:GrupoPesquisaVO, ordernarPor:String ):void
		{
			var token:AsyncToken = this.service.buscaPorExemplo( params, ordernarPor );
			token.addResponder( responder );
		}
	}
}