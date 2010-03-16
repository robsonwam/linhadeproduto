package br.ufpe.cin.reuso.util
{
	public class ObjectTranslate
	{
		public function ObjectTranslate()
		{
		}

		static public function translateModuloVO( sourceObject:Object ):ModuloVO
		{
			var moduloVO:ModuloVO = new PerfilModuloVO();
			moduloVO.id = sourceObject.id;
			moduloVO.descricao = sourceObject.descricao;
			moduloVO.nome = sourceObject.nome;
			moduloVO.flagAcesso = sourceObject.flagAcesso;

			moduloVO.parent = null;

			if ( sourceObject.modulo != null )
			{
				perfilModuloVO.modulo = translateModuloVO( sourceObject.modulo );
			}

			perfilModuloVO.perfilAcesso = null;

			if ( sourceObject.perfilAcesso != null )
			{
				perfilModuloVO.perfilAcesso = translatePerfilAcessoVO( sourceObject.perfilAcesso );
			}

			perfilModuloVO.pk = null;

			if ( sourceObject.pk != null )
			{
				perfilModuloVO.pk = translatePerfilModuloPKVO( sourceObject.pk );
			}

			perfilModuloVO.relatoriosCollection = new ArrayCollection();

			if ( sourceObject.relatoriosCollection != null )
			{
				perfilModuloVO.relatoriosCollection = sourceObject.relatoriosCollection;
			}

			return perfilModuloVO;
		}


		static public function translatePerfilModuloVO( sourceObject:Object ):PerfilModuloVO
		{
			var perfilModuloVO:PerfilModuloVO = new PerfilModuloVO();
			perfilModuloVO.aprovar = sourceObject.aprovar;
			perfilModuloVO.consultar = sourceObject.consultar;
			perfilModuloVO.criar = sourceObject.criar;
			perfilModuloVO.editar = sourceObject.editar;

			perfilModuloVO.modulo = null;

			if ( sourceObject.modulo != null )
			{
				perfilModuloVO.modulo = translateModuloVO( sourceObject.modulo );
			}

			perfilModuloVO.perfilAcesso = null;

			if ( sourceObject.perfilAcesso != null )
			{
				perfilModuloVO.perfilAcesso = translatePerfilAcessoVO( sourceObject.perfilAcesso );
			}

			perfilModuloVO.pk = null;

			if ( sourceObject.pk != null )
			{
				perfilModuloVO.pk = translatePerfilModuloPKVO( sourceObject.pk );
			}

			perfilModuloVO.relatorioCollection = new ArrayCollection();

			if ( sourceObject.relatoriosCollection != null )
			{
				perfilModuloVO.relatorioCollection = sourceObject.relatoriosCollection;
			}

			return perfilModuloVO;
		}

	}
}