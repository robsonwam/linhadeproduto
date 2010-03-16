package br.ufpe.cin.reuso.services
{
	/**
	* Classe de constantes para declarações de RemoteDestination,
	* onde contém as informações de source e id do destination em questão.
	**/
	public class RemoteDestination
	{
		private var destination : String = new String();
		private var source      : String = new String();
		
		/**
		* Nome de destination para operações com Usuário.
		**/
		public static const USER_DESTINATION:RemoteDestination = new RemoteDestination("facadeFlexSaudeResidencia","br.com.r2jm.sauderesidencia.controller.FacadeFlexSaudeResidencia");
	
	
		public function RemoteDestination(name:String, source:String)
		{
			this.destination = name;
			this.source = source;
		}

		/**
		* Retorna o id do serviço remoto.
		**/
		public function getDestination():String
		{
			return destination;
		}

		/**
		* Retorna o source do serviço remoto.
		**/
		public function getSource():String
		{
			return this.source;
		}
		
	}
}