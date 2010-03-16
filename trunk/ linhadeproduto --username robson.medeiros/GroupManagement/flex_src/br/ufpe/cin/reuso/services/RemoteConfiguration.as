package br.com.r2jm.sauderesidencia.services
{
	/**
	* Classe de constantes para declarações de RemoteDestination,
	* onde contém as informações de source e id do destination em questão.
	**/
	public class RemoteConfiguration
	{
		
		/**
		 *  destination id ="facadeFlexSaudeResidencia"
		 **/
		private var destination : String = "facadeFlexReuso";
		
		/** 
		* Namespace.NomeDaClasse no JAVA
		**/
		private var source : String = "br.ufpe.cin.reuso.controller.FacadeFlexReuso";
		
		/**
		* Exibe o relogio no lugar do cursor durante a requisição 
		**/
		private var showBusyCursor : Boolean = true;

		/**
		* Nome de destination para operações com Usuário.
		**/
		public static const USER_DESTINATION:RemoteConfiguration = new RemoteConfiguration("facadeFlexSaudeResidencia","br.com.r2jm.sauderesidencia.controller.FacadeFlexSaudeResidencia",true);
	
		public function RemoteConfiguration(name:String, source:String, showBusyCursor:Boolean)
		{
			this.destination = name;
			this.source = source;
			this.showBusyCursor = showBusyCursor;
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
		
		/**
		* Exibe o relogio no lugar do cursor durante a requisição.
		**/
		public function getShowBusyCursor():Boolean
		{
			return this.showBusyCursor;
		}
		
	}
}