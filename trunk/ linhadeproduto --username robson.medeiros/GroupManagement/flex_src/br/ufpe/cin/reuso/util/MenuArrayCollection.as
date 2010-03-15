package br.ufpe.cin.reuso.util
{
	import br.com.r2jm.sauderesidencia.vo.PerfilModuloVO;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.MenuEvent;
	import mx.utils.StringUtil;

	public class MenuArrayCollection
	{
		public function MenuArrayCollection()
		{
		}

		public function getMenu():ArrayCollection
		{
			var dp:ArrayCollection = new ArrayCollection();
			var flagGestorAcesso:String = "N";

			if ( model.userLogged != null )
			{
				if ( model.userLogged.funcionario != null )
				{
					dp = model.userLogged.funcionario.perfilAcesso.perfilModuloCollection as ArrayCollection;
					flagGestorAcesso = model.userLogged.funcionario.perfilAcesso.flagGestorAcesso.toUpperCase();
				}
			}
			return createMenu( flagGestorAcesso, ( dp as ArrayCollection ));
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

		private function createMenu( flagGestorAcesso:String, dp:ArrayCollection ):ArrayCollection
		{
			var strMenu:ArrayCollection = new ArrayCollection();
			strMenu.addItem({ label: "Programa", enabled: "true", data: "", children: [{ label: "Sair", enabled: "true", data: "out" }]});

			for ( var i:uint = 0; i < dp.length; i++ )
			{
				var perfilModuloVO:PerfilModuloVO = ( dp.getItemAt( i ) as PerfilModuloVO );

				if ( perfilModuloVO.modulo != null )
				{
					if ( perfilModuloVO.modulo.parent == 0 )
					{
						var nome:String = StringUtil.trim( perfilModuloVO.modulo.nome.toString());
						var mod_id:int = perfilModuloVO.modulo.id; //data="' + mod_id.toString() + '"
						var habilitar:String = this.validMenuEnabled( flagGestorAcesso, perfilModuloVO.modulo.flagAcesso.toUpperCase());
						var myArray:Array = this.getChildMenu( flagGestorAcesso, dp, mod_id );

						if ( myArray.length > 0 )
						{
							strMenu.addItem({ label: nome, enabled: "" + habilitar + "", data: "" + mod_id.toString() + "", children: myArray });
						}
						else
						{
							strMenu.addItem({ label: nome, enabled: "" + habilitar + "", data: "" + mod_id.toString() + "" });
						}
					}
				}
			}
			return strMenu;
		}

		private function getChildMenu( flagGestorAcesso:String, dp:ArrayCollection, parentId:int ):Array
		{
			var strMenu:ArrayCollection = new ArrayCollection();

			for ( var i:uint = 0; i < dp.length; i++ )
			{
				var perfilModuloVO:PerfilModuloVO = ( dp.getItemAt( i ) as PerfilModuloVO );

				if ( perfilModuloVO.modulo != null )
				{
					if ( perfilModuloVO.modulo.parent == parentId )
					{
						var nome:String = StringUtil.trim( perfilModuloVO.modulo.nome.toString());
						var mod_id:int = perfilModuloVO.modulo.id;
						var habilitar:String = this.validMenuEnabled( flagGestorAcesso, perfilModuloVO.modulo.flagAcesso.toUpperCase());
						var myArray:Array = this.getChildMenu( flagGestorAcesso, dp, mod_id );

						if ( myArray.length > 0 )
						{
							strMenu.addItem({ label: nome, enabled: "" + habilitar + "", data: "" + mod_id.toString() + "", children: myArray });
						}
						else
						{
							strMenu.addItem({ label: nome, enabled: "" + habilitar + "", data: "" + mod_id.toString() + "" });
						}
					}
				}
			}
			return strMenu.toArray();
		}
	}
}