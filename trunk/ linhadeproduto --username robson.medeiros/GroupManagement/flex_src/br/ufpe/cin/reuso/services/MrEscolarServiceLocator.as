package br.ufpe.cin.reuso.services
{

    [Bindable]
	public class ReusoServiceLocator
	{
		
		private static var _instance : ReusoServiceLocator;
		private var remoteObject:RemoteConection = null;

        public static function getInstance() : ReusoServiceLocator
        {
             if ( _instance == null )
                  _instance = new ReusoServiceLocator( arguments.callee );
             return _instance;
        }

        //NOTE: AS3 does not allow for private or protected constructors
        public function ReusoServiceLocator( caller : Function = null )
        {
            if( caller != ReusoServiceLocator.getInstance)
              throw new Error ("Facade is a singleton class, use getInstance() instead");
            if( ReusoServiceLocator._instance != null )
                throw new Error( "Only one Facade instance should be instantiated" );
            
            this.remoteObject = new RemoteConection(RemoteConfiguration.USER_DESTINATION);
        }
        
        public function getRemoteObjectConection():RemoteConection
        {
        	   return this.remoteObject;
		}
		
		public function call(metodoName:String, vo:Object = null, faultFunction:Function = null, successFunction:Function = null):void
        {
        	   this.remoteObject.call(metodoName, vo, faultFunction, successFunction);
		}

	}
}