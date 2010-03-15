package br.ufpe.cin.reuso.util
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.utils.StringUtil;

	public class MenuXMLList
	{
		public function MenuXMLList()
		{
		}

		private function validMenuEnabled( flagGestorAcesso:String, flagAcesso:String ):String
		{
			var habilitar:Boolean = ( flagGestorAcesso == 'S' );

			if ( !habilitar )
			{
				habilitar = ( flagAcesso == "S" );
			}
			return habilitar ? "true" : "false";
		}

		public function getMenu( flagGestorAcesso:String, dp:ArrayCollection ):XMLList
		{
			var dtp:ArrayCollection = dp;
			dtp.sort;
			return createMenu( flagGestorAcesso, ( dtp as ArrayCollection ));
		}

		private function createMenu( flagGestorAcesso:String, dp:ArrayCollection ):XMLList
		{
			var strMenu:String = '<>';
			strMenu = strMenu + '<menuitem label="Programa">';
            strMenu = strMenu + '  <menuitem label="Mudar Senha" data="1"/>';
			strMenu = strMenu + '  <menuitem label="Sair" data="-1"/>';
			strMenu = strMenu + '</menuitem>';

			for ( var i:uint = 0; i < dp.length; i++ )
			{
				var perfilModuloVO:PerfilModuloVO = ( dp.getItemAt( i ) as PerfilModuloVO );

				if ( perfilModuloVO.moduloId != null )
				{
					if ( perfilModuloVO.moduloId.parentId == 0 )
					{
						var nome:String = StringUtil.trim( perfilModuloVO.moduloId.nomeModulo.toString());
						var mod_id:int = perfilModuloVO.moduloId.moduloId;
						var habilitar:String = this.validMenuEnabled( flagGestorAcesso, perfilModuloVO.flagAcesso.toUpperCase());
						strMenu = strMenu + '<menuitem label="' + nome + '" enabled="' + habilitar + '">';
						strMenu = strMenu + this.getChildMenu( flagGestorAcesso, dp, mod_id );
						strMenu = strMenu + '</menuitem>';
					}
				}
			}
			strMenu = strMenu + '</>';
			return new XMLList( strMenu );
		}

		private function getChildMenu( flagGestorAcesso:String, dp:ArrayCollection, parentId:int ):String
		{

			var strMenu:String = "";

			// var txt:String ="";
			for ( var i:uint = 0; i < dp.length; i++ )
			{
				var perfilModuloVO:PerfilModuloVO = ( dp.getItemAt( i ) as PerfilModuloVO );

				if ( perfilModuloVO.moduloId != null )
				{

					//try{ txt+= perfilModuloVO.modulo.id.toString()+" - " + perfilModuloVO.modulo.nome.toString()+" - "+perfilModuloVO.modulo.parent.toString()+"\n";
					//}catch (e:Error){Alert.show(e.errorID.toString() + ", " + e.name + ", " + e.message + ", " + e.getStackTrace());}


					if ( perfilModuloVO.moduloId.parentId == parentId )
					{

						var nome:String = StringUtil.trim( perfilModuloVO.moduloId.nomeModulo.toString());
						var mod_id:int = perfilModuloVO.moduloId.moduloId;
						var habilitar:String = this.validMenuEnabled( flagGestorAcesso, perfilModuloVO.flagAcesso.toUpperCase());
						var strChild:String = this.getChildMenu( flagGestorAcesso, dp, mod_id );


						if ( strChild.length > 0 )
						{
							strMenu = strMenu + '<menuitem label="' + nome + '" data="' + mod_id.toString() + '">';
							strMenu = strMenu + strChild;
							strMenu = strMenu + '</menuitem>';
						}
						else
						{
							strMenu = strMenu + '<menuitem label="' + nome + '" data="' + mod_id.toString() + '"/>';
						}
					}
				}
			}
			//Alert.show(txt);
			return strMenu;
		}
	}
}