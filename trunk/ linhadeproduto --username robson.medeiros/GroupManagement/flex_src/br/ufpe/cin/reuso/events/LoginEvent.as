package br.ufpe.cin.reuso.events
{
	import br.ufpe.cin.reuso.vo.LoginVO;
	
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;

	public class LoginEvent extends CairngormEvent
	{
		public static const DO_LOGIN:String = "doLogin";

		public var login:LoginVO;

		public function LoginEvent( type:String, bubbles:Boolean = true, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}

		override public function clone():Event
		{
			return new LoginEvent( this.type );
		}


	}
}