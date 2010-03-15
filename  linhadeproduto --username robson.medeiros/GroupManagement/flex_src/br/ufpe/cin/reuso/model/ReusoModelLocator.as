package br.ufpe.cin.reuso.model
{

	import br.ufpe.cin.reuso.vo.MembroVO;
	
	import com.adobe.cairngorm.CairngormError;
	import com.adobe.cairngorm.CairngormMessageCodes;
	import com.adobe.cairngorm.model.IModelLocator;

	[Bindable]
	public class ReusoModelLocator implements IModelLocator
	{
		// Unica instancia do ModelLocator
		private static var instance:ReusoModelLocator;

		public function ReusoModelLocator()
		{
			if ( instance != null )
			{
				throw new CairngormError( CairngormMessageCodes.SINGLETON_EXCEPTION, "ModelLocator" );
			}

			instance = this;
		}

		public static function getInstance():ReusoModelLocator
		{
			if ( instance == null )
			{
				instance = new ReusoModelLocator();
			}

			return instance;
		}

		public function clear():void
		{
			this.userLogged = null;
			this.workflowState = 0;
		}

		/*  CONSTANTES INDICA O TIPO DE AÇÃO DE UM FORM */
		public static const AC_INSERT:uint = 1;

		public static const AC_DETAIL:uint = 2;

		public static const AC_UPDATE:uint = 3;

		public static const AC_DELETE:uint = 4;

		public static const AC_LIST:uint = 5;


		/* Services Configuration */
		public static const SERVICES_LOCATION:String = "reusoServiceLocation";

		public static const SERVICES_DESTINATION:String = "facadeFlexReuso";

		public static const SERVICES_SOURCE:String = "br.ufpe.cin.reuso.controller.FacadeFlexReuso";

		public static const SERVICES_SHOW_BUSY:Boolean = true;

		public var userLogged:MembroVO;

		public var workflowState:uint = 0;

		static public var STATE_CHECKED:String = "checked";

		static public var STATE_UNCHECKED:String = "unchecked";

	}
}

// Classe utilitária para proibir o acesso à classe construtora
class SingletonEnforcer
{
}