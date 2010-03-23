package br.ufpe.cin.reuso.control
{
	
	import br.ufpe.cin.reuso.commands.LoginCommand;
	import br.ufpe.cin.reuso.commands.MembroCommand;
	import br.ufpe.cin.reuso.commands.PublicacaoCommand;
	import br.ufpe.cin.reuso.commands.TipoCommand;
	import br.ufpe.cin.reuso.events.LoginEvent;
	import br.ufpe.cin.reuso.events.MembroEvent;
	import br.ufpe.cin.reuso.events.PublicacaoEvent;
	import br.ufpe.cin.reuso.events.TipoEvent;
	
	import com.adobe.cairngorm.control.FrontController;

	public class ReusoController extends FrontController
	{
		public function ReusoController()
		{
			this.initialize();
		}

		public function initialize():void
		{

			//ADD COMMANDS
			this.addCommand( LoginEvent.DO_LOGIN, LoginCommand );

			//Formas de pagamento
			this.addCommand( MembroEvent.EVENT_PESQUISAR, MembroCommand );
			this.addCommand( MembroEvent.EVENT_INSERIR, MembroCommand );
			this.addCommand( MembroEvent.EVENT_EDITAR, MembroCommand );
			this.addCommand( MembroEvent.EVENT_EXCLUIR, MembroCommand );

			//Tipo
			this.addCommand( TipoEvent.EVENT_PESQUISAR, TipoCommand );
			this.addCommand( TipoEvent.EVENT_INSERIR, TipoCommand );
			this.addCommand( TipoEvent.EVENT_EDITAR, TipoCommand );
			this.addCommand( TipoEvent.EVENT_EXCLUIR, TipoCommand );

			//Publicacao
			this.addCommand( PublicacaoEvent.EVENT_PESQUISAR, PublicacaoCommand );
			this.addCommand( PublicacaoEvent.EVENT_INSERIR, PublicacaoCommand );
			this.addCommand( PublicacaoEvent.EVENT_EDITAR, PublicacaoCommand );
			this.addCommand( PublicacaoEvent.EVENT_EXCLUIR, PublicacaoCommand );
//
//			//Parcela
//			this.addCommand( ParcelaEvent.EVENT_PESQUISAR, ParcelaCommand );
//			this.addCommand( ParcelaEvent.EVENT_INSERIR, ParcelaCommand );
//			this.addCommand( ParcelaEvent.EVENT_EDITAR, ParcelaCommand );
//			this.addCommand( ParcelaEvent.EVENT_EXCLUIR, ParcelaCommand );
//
//			//ConsultaParcela
//			this.addCommand( ConsultaParcelaEvent.EVENT_PESQUISAR, ConsultaParcelaCommand );
//			this.addCommand( ConsultaParcelaEvent.EVENT_INSERIR, ConsultaParcelaCommand );
//			this.addCommand( ConsultaParcelaEvent.EVENT_EDITAR, ConsultaParcelaCommand );
//			this.addCommand( ConsultaParcelaEvent.EVENT_EXCLUIR, ConsultaParcelaCommand );
//
//			//LancamentoVerba
//			this.addCommand( LancamentoVerbaEvent.EVENT_PESQUISAR, LancamentoVerbaCommand );
//			this.addCommand( LancamentoVerbaEvent.EVENT_INSERIR, LancamentoVerbaCommand );
//			this.addCommand( LancamentoVerbaEvent.EVENT_EDITAR, LancamentoVerbaCommand );
//			this.addCommand( LancamentoVerbaEvent.EVENT_EXCLUIR, LancamentoVerbaCommand );
//
//			//Evento
//			this.addCommand( EventoEvent.EVENT_PESQUISAR, EventoCommand );
//			this.addCommand( EventoEvent.EVENT_INSERIR, EventoCommand );
//			this.addCommand( EventoEvent.EVENT_EDITAR, EventoCommand );
//			this.addCommand( EventoEvent.EVENT_EXCLUIR, EventoCommand );
//
//			//Cargos
//			this.addCommand( CargoEvent.EVENT_PESQUISAR, CargoCommand );
//			this.addCommand( CargoEvent.EVENT_INSERIR, CargoCommand );
//			this.addCommand( CargoEvent.EVENT_EDITAR, CargoCommand );
//			this.addCommand( CargoEvent.EVENT_EXCLUIR, CargoCommand );
//
//			//Funcionarios
//			this.addCommand( FuncionarioEvent.EVENT_PESQUISAR, FuncionarioCommand );
//			this.addCommand( FuncionarioEvent.EVENT_INSERIR, FuncionarioCommand );
//			this.addCommand( FuncionarioEvent.EVENT_EDITAR, FuncionarioCommand );
//			this.addCommand( FuncionarioEvent.EVENT_EXCLUIR, FuncionarioCommand );
//
//			//TipoEventos
//			this.addCommand( TipoEventoEvent.EVENT_PESQUISAR, TipoEventoCommand );
//			this.addCommand( TipoEventoEvent.EVENT_INSERIR, TipoEventoCommand );
//			this.addCommand( TipoEventoEvent.EVENT_EDITAR, TipoEventoCommand );
//			this.addCommand( TipoEventoEvent.EVENT_EXCLUIR, TipoEventoCommand );
//
//			//Ambulancias
//			this.addCommand( AmbulanciaEvent.EVENT_PESQUISAR, AmbulanciaCommand );
//			this.addCommand( AmbulanciaEvent.EVENT_INSERIR, AmbulanciaCommand );
//			this.addCommand( AmbulanciaEvent.EVENT_EDITAR, AmbulanciaCommand );
//			this.addCommand( AmbulanciaEvent.EVENT_EXCLUIR, AmbulanciaCommand );
//
//			//Bancos
//			this.addCommand( BancoEvent.EVENT_PESQUISAR, BancoCommand );
//			this.addCommand( BancoEvent.EVENT_INSERIR, BancoCommand );
//			this.addCommand( BancoEvent.EVENT_EDITAR, BancoCommand );
//			this.addCommand( BancoEvent.EVENT_EXCLUIR, BancoCommand );
//			
//			//PerfilAcesso
//			this.addCommand( PerfilAcessoEvent.EVENT_PESQUISAR, PerfilAcessoCommand );
//			this.addCommand( PerfilAcessoEvent.EVENT_INSERIR, PerfilAcessoCommand );
//			this.addCommand( PerfilAcessoEvent.EVENT_EDITAR, PerfilAcessoCommand );
//			this.addCommand( PerfilAcessoEvent.EVENT_EXCLUIR, PerfilAcessoCommand );
			
		}
	}
}