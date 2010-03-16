package br.ufpe.cin.reuso.business
{
	import br.ufpe.cin.reuso.model.ReusoModelLocator;
	import br.ufpe.cin.reuso.vo.LoginVO;
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	public class LoginDelegate
	{
		private var responder:IResponder;

		private var service:Object;

		public function LoginDelegate( responder:IResponder )
		{
			this.service = ServiceLocator.getInstance().getRemoteObject( ReusoModelLocator.SERVICES_LOCATION );
			this.responder = responder;

		}

		public function DoLogin( login:LoginVO ):void
		{
			var token:AsyncToken = this.service.doLogin( login );
			token.addResponder( responder );
			//this.service.call('doLogin', login, null, this.responder.result);
		}

	}
}