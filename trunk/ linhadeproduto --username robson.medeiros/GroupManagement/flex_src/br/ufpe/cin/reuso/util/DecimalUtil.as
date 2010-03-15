package br.ufpe.cin.reuso.util
{

	public class DecimalUtil
	{
		public static function convertDecimalToValor( decimal:Number ):String
		{
			var retorno:String;
			var dec:String;
			var newDecimal:String = "";
			decimal = Number(decimal.toFixed(2));
			if ( decimal == 0 || decimal.toString().length <= 0 )
			{
				retorno = "0,00";
			}
			else if ( decimal.toString().lastIndexOf( "." ) == -1 )
			{
				retorno = decimal.toString() + ".00";
			}
			else if (( decimal.toString().length ) - decimal.toString().lastIndexOf( "." ) <= 2 )
			{
				retorno = decimal.toString() + "0";
			}
			else
			{
				retorno = decimal.toString();
			}
			
			retorno = retorno.replace( ".", "," );

			dec = retorno.substring( 0, retorno.length - 3 );

			if ( dec.length > 3 )
			{
				for ( var i:int = dec.length; i >= 0; i = i - 3 )
				{
					newDecimal = "." + dec.substring( i - 3, i ) + newDecimal
				}
				newDecimal = newDecimal.substring( 1, newDecimal.length );
				retorno = newDecimal + retorno.substring( retorno.length - 3, retorno.length );
			}
			return retorno;
		}
	}
}