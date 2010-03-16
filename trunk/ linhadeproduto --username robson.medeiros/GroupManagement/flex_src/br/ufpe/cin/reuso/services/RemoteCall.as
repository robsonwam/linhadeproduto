package br.ufpe.cin.reuso.services
{
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent; 
	import mx.rpc.remoting.mxml.RemoteObject;
	
	/**
	* Classe de requisições remotas usando RemoteObject.
	**/
	public class RemoteCall{

		/**
		* Indica se o channelSet está construido.
		*/
		private var channelBuilded:Boolean = false;
		/**
		* ChannelSet do RemoteObject
		**/
		private var channelSet : ChannelSet = new ChannelSet();
		/**
		* RemoteDestination
		**/
		private var destination:RemoteDestination = null;
		
		/**
		*
		* @param destination O Destination do RemoteObject.
		**/
		public function RemoteCall(destination:RemoteDestination)
		{
			this.destination = destination;
		}
		
		/**
		* Cria um ChannelSet.
		**/
		private function getChannelSet():void
		{
			var amfChannel:AMFChannel = new AMFChannel("my-amf",getMessageBroker());
			channelSet.addChannel(amfChannel);
			channelBuilded = true;
		}

		/**
		* Retorna o endereço messagebroker da aplicação.
		**/
		private function getMessageBroker():String{
			return Application.application.url.substr(0,
			Application.application.url.indexOf("/cms.swf"))
			+"/messagebroker/amf";
			//return"http://{server.name}:{server.port}/{context.root}/messagebroker/amf";
		}
		
		/**
		* Invoca uma requisição remota.
		* @param operation Operação a ser executada no lado servidor.
		* @param faultFunction Função a ser executada caso ocorra um erro.
		* @param successFunction Função a ser executada caso a operação remota ocorra com sucesso.
		* @param args Argumentos passados a operação remota.
		**/
		public function invoke(operation:String, faultFunction:Function = null,	successFunction:Function = null, ...args):void
		{
			// capturando o remoteObject
			var remoteObject : RemoteObject = getRemoteObject(destination.getDestination());
			// setando o source ( pacote + classe )
			remoteObject.source = this.destination.getSource();
			// adicionando listener para a funcao de retorno
			remoteObject.addEventListener(ResultEvent.RESULT, successFunction);
			//se foi definido uma função de erro.
			if(faultFunction != null){
				remoteObject.addEventListener(FaultEvent.FAULT, faultFunction);
			}else{
				remoteObject.addEventListener(FaultEvent.FAULT, onFault);
			}
		
			// se a lista de argumentos for vazia não será passado nada como parametro.
			// capturando o nome do método do destination a ser invocado.
			var remoteOperation:mx.rpc.AbstractOperation = remoteObject[operation]; 
			if(args[0] != null){
			// serando os argumentos
				remoteOperation.arguments = args;
			}
		    // invocando o servico remoto
			remoteOperation.send();
		}
		
		/**
		* Constroe o remoteObject
		**/
		private function getRemoteObject(destination:String):RemoteObject
		{
			if(channelBuilded == false)
				getChannelSet();
			var remoteObject:RemoteObject = new RemoteObject(destination);
			remoteObject.channelSet = channelSet;
			return remoteObject;
		}
		
		/**
		* Manipulador default de mensagens de erro, caso não for
		* expecificado será invocada esta função em caso de erro.
		**/
		private function onFault(result:FaultEvent):void
		{
			Alert.show(String(result.message));
		}
	}
}