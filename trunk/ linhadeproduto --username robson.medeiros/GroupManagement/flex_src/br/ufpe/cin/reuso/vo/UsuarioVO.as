package br.ufpe.cin.reuso.vo
{

	[Bindable]
	public class UsuarioVO
	{
		public var login:LoginVO;
		public var membro:MembroVO;
		public var dataAcesso:Date;
		public var dataUltimoAcesso:Date;

		public function UsuarioVO( pLogin:LoginVO = null, pMembro:MembroVO = null )
		{
			this.login = pLogin;
			this.membro = pMembro;
		}

	}
}