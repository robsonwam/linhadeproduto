package br.ufpe.cin.reuso.util
{

	public class ExceptionReuso
	{
		private var msg:String = "";

		public function ExceptionReuso( msg:String = "" )
		{

		}

		public function getMensage():String
		{
			return this.msg;
		}
	}
}