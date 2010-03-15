package br.ufpe.cin.reuso.util
{
	import mx.collections.ArrayCollection;
	

	public class ReusoUtil
	{
		public function ReusoUtil()
		{
		}

		public static function print_r( obj:*, level:int = 0, output:String = "" ):*
		{
			var tabs:String = "";

			for ( var i:int = 0; i < level; i++, tabs += "\t" )
				;

			for ( var child:*in obj )
			{
				output += tabs + "[" + child + "] => " + obj[ child ];
				var childOutput:String = print_r( obj[ child ], level + 1 );

				if ( childOutput != '' )
					output += ' {\n' + childOutput + tabs + '}';
				output += "\n";
			}

			if ( level == 0 )
				trace( output );
			else
				return output;
		}

		public static function SNToBoolean( s:String ):Boolean
		{
			return (( s == null ) ? false : ( s.toLowerCase() == 's' ));
		}

		public static function BooleanToSN( s:Boolean ):String
		{
			return (( s ) ? 'S' : 'N' );
		}
		
		public static function getSexo():ArrayCollection
		{
			var sexo:ArrayCollection = new ArrayCollection();
			sexo.addItem({ label: "", data: null });
			sexo.addItem({ label: "Feminino", data: "F" });
			sexo.addItem({ label: "Masculino", data: "M" });
			return sexo;
		}
		
		public static function getEstadoCivil():ArrayCollection
		{
			var sexo:ArrayCollection = new ArrayCollection();
			sexo.addItem({ label: "", data: null });
			sexo.addItem({ label: "Casado", data: "C" });
			sexo.addItem({ label: "Solteiro", data: "S" });
			return sexo;
		}

		public static function getEstadoBrasil():ArrayCollection
		{
			var estados:ArrayCollection = new ArrayCollection();
			estados.addItem({ data: null, label: "" });
			estados.addItem({ data: "AC", label: "AC - Acre" });
			estados.addItem({ data: "AL", label: "AL - Alagoas" });
			estados.addItem({ data: "AP", label: "AP - Amapá" });
			estados.addItem({ data: "AM", label: "AM - Amazonas" });
			estados.addItem({ data: "BA", label: "BA - Bahia" });
			estados.addItem({ data: "CE", label: "CE - Ceará" });
			estados.addItem({ data: "DF", label: "DF - Distrito Federal" });
			estados.addItem({ data: "ES", label: "ES - Espírito Santo" });
			estados.addItem({ data: "GO", label: "GO - Coiás" });
			estados.addItem({ data: "MA", label: "MA - Maranhão" });
			estados.addItem({ data: "MT", label: "MT - Mato Grosso" });
			estados.addItem({ data: "MS", label: "MS - Mato Grosso Sul" });
			estados.addItem({ data: "MG", label: "MG - Minas Gerais" });
			estados.addItem({ data: "PA", label: "PA - Pará" });
			estados.addItem({ data: "PB", label: "PB - Paraíba" });
			estados.addItem({ data: "PR", label: "PR - Paraná" });
			estados.addItem({ data: "PR", label: "PE - Pernambuco" });
			estados.addItem({ data: "PI", label: "PI - Piuaí" });
			estados.addItem({ data: "RJ", label: "RJ - Rio de Janeiro" });
			estados.addItem({ data: "RN", label: "RN - Rio Grande do Norte" });
			estados.addItem({ data: "RS", label: "RS - Rio Grande do Sul" });
			estados.addItem({ data: "RO", label: "RO - Rondônia" });
			estados.addItem({ data: "RR", label: "RR - Roraima" });
			estados.addItem({ data: "RC", label: "SC - Santa Catarina" });
			estados.addItem({ data: "SP", label: "SP - São Paulo" });
			estados.addItem({ data: "SE", label: "SE - Sergipe" });
			estados.addItem({ data: "TO", label: "TO - Tocantins" });
			return estados;
		}
	}

}