package br.ufpe.cin.reuso.services
{
	import mx.controls.Alert;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.Operation;
	import mx.rpc.remoting.mxml.RemoteObject;
     
	public class RemoteConection{			
 
		// URL do gateway do DataService
		// no caso está apontando para uma URL padrão do AMFPHP, mas poderia ser outro DS
		public static var endPointUrl:String = "http://{server.name}:{server.port}/{context.root}/messagebroker/amf";
		// nome para o canal de comunicação
		public static var channelName:String = "my-amf";
        
        private var remoteConfiguration:RemoteConfiguration;
          
        public function RemoteConection(remoteConfiguration:RemoteConfiguration)
        {
               this.remoteConfiguration = remoteConfiguration;
        }
 
     	private function getRemoteObject(faultFunction:Function = null, successFunction:Function = null):RemoteObject
     	{
		    var remoteObj:RemoteObject = new RemoteObject(this.remoteConfiguration.getDestination()); 
		    remoteObj.source           = this.remoteConfiguration.getSource();
		    remoteObj.showBusyCursor   = this.remoteConfiguration.getShowBusyCursor();
		    //Adiciona o evento falha na lista de eventos do ojeto remoto
		    if(faultFunction != null){
				remoteObj.addEventListener(FaultEvent.FAULT, faultFunction);
			}else{
				remoteObj.addEventListener(FaultEvent.FAULT, onConnectionFault);
			}
		  
		    //Verifica se é null porque nem sempre um método vai retornar algum valor.
		    if(successFunction != null)  
		        remoteObj.addEventListener(ResultEvent.RESULT, successFunction);  
		    return remoteObj; //retorna o objeto remoto configurado.	
		}
		 
 
		/**
		 * Método que pré-configura o RemoteObject
		 * definindo o canal de comunicação com o
		 * respectivo DataService que está sendo utilizado no
		 * back-end, com isso não há a necessidade de utilizar
		 * o service-config. xml definida na compilação do
		 * projeto
		 */
		private function instanceRemoteObject() : RemoteObject {
			// Cria um ChannelSet.
			var cs:ChannelSet = new ChannelSet();
 
			// Cria um Channel.
			var customChannel:Channel = new AMFChannel(
				// define o nome do canal
				channelName,
				// define a URL de conexão
				endPointUrl
			);
 
			// Adiciona o Channel ao ChannelSet.
			cs.addChannel(customChannel);
 
			// instância o objeto
			var connection:RemoteObject = new RemoteObject(channelName);
 
			// Assign the ChannelSet to a RemoteObject instance.
			connection.channelSet = cs; 
 
			// retorna a instância do RemoteObject
			return connection;
		}
 
		/**
		* Método que trata quando há algum erro de
		* Conexão com o AMFPHP
		*
		* @param event:FaultEvent
		*/
		public function onConnectionFault(event:FaultEvent) : void {
			Alert.show(event.fault.message + "\n"+event.fault.getStackTrace(),"Erro!");
		}
 
		/**
		*
		* @param Método da Classe
		* @callBack Função de Retorno do Método Assincrono
		* @VO Instancia do VO que navegará entre as camadas no back-end
		*/
		public function call(metodoName:String, vo:Object = null, faultFunction:Function = null, successFunction:Function = null) : void 
		{
            var op:Operation = ((this.getRemoteObject(faultFunction,successFunction) as RemoteObject).getOperation(metodoName) as Operation);
			if(vo == null )
			   op.send() 
			else
			   op.send(vo);
		}
	}
}