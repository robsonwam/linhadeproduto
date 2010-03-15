package br.ufpe.cin.reuso.control
{
	
	import com.adobe.cairngorm.control.FrontController;

	public class SaudeResidenciaController extends FrontController
	{
		public function SaudeResidenciaController()
		{
			this.initialize();
		}

		public function initialize():void
		{

			//ADD COMMANDS
			this.addCommand( LoginEvent.DO_LOGIN, LoginCommand );

			//Formas de pagamento
			this.addCommand( FormaPagamentoEvent.EVENT_PESQUISAR, FormaPagamentoCommand );
			this.addCommand( FormaPagamentoEvent.EVENT_INSERIR, FormaPagamentoCommand );
			this.addCommand( FormaPagamentoEvent.EVENT_EDITAR, FormaPagamentoCommand );
			this.addCommand( FormaPagamentoEvent.EVENT_EXCLUIR, FormaPagamentoCommand );

			//Departamento
			this.addCommand( DepartamentoEvent.EVENT_PESQUISAR, DepartamentoCommand );
			this.addCommand( DepartamentoEvent.EVENT_INSERIR, DepartamentoCommand );
			this.addCommand( DepartamentoEvent.EVENT_EDITAR, DepartamentoCommand );
			this.addCommand( DepartamentoEvent.EVENT_EXCLUIR, DepartamentoCommand );

			//Verba
			this.addCommand( VerbaEvent.EVENT_PESQUISAR, VerbaCommand );
			this.addCommand( VerbaEvent.EVENT_INSERIR, VerbaCommand );
			this.addCommand( VerbaEvent.EVENT_EDITAR, VerbaCommand );
			this.addCommand( VerbaEvent.EVENT_EXCLUIR, VerbaCommand );

			//Parcela
			this.addCommand( ParcelaEvent.EVENT_PESQUISAR, ParcelaCommand );
			this.addCommand( ParcelaEvent.EVENT_INSERIR, ParcelaCommand );
			this.addCommand( ParcelaEvent.EVENT_EDITAR, ParcelaCommand );
			this.addCommand( ParcelaEvent.EVENT_EXCLUIR, ParcelaCommand );

			//ConsultaParcela
			this.addCommand( ConsultaParcelaEvent.EVENT_PESQUISAR, ConsultaParcelaCommand );
			this.addCommand( ConsultaParcelaEvent.EVENT_INSERIR, ConsultaParcelaCommand );
			this.addCommand( ConsultaParcelaEvent.EVENT_EDITAR, ConsultaParcelaCommand );
			this.addCommand( ConsultaParcelaEvent.EVENT_EXCLUIR, ConsultaParcelaCommand );

			//LancamentoVerba
			this.addCommand( LancamentoVerbaEvent.EVENT_PESQUISAR, LancamentoVerbaCommand );
			this.addCommand( LancamentoVerbaEvent.EVENT_INSERIR, LancamentoVerbaCommand );
			this.addCommand( LancamentoVerbaEvent.EVENT_EDITAR, LancamentoVerbaCommand );
			this.addCommand( LancamentoVerbaEvent.EVENT_EXCLUIR, LancamentoVerbaCommand );

			//Evento
			this.addCommand( EventoEvent.EVENT_PESQUISAR, EventoCommand );
			this.addCommand( EventoEvent.EVENT_INSERIR, EventoCommand );
			this.addCommand( EventoEvent.EVENT_EDITAR, EventoCommand );
			this.addCommand( EventoEvent.EVENT_EXCLUIR, EventoCommand );

			//Cargos
			this.addCommand( CargoEvent.EVENT_PESQUISAR, CargoCommand );
			this.addCommand( CargoEvent.EVENT_INSERIR, CargoCommand );
			this.addCommand( CargoEvent.EVENT_EDITAR, CargoCommand );
			this.addCommand( CargoEvent.EVENT_EXCLUIR, CargoCommand );

			//Funcionarios
			this.addCommand( FuncionarioEvent.EVENT_PESQUISAR, FuncionarioCommand );
			this.addCommand( FuncionarioEvent.EVENT_INSERIR, FuncionarioCommand );
			this.addCommand( FuncionarioEvent.EVENT_EDITAR, FuncionarioCommand );
			this.addCommand( FuncionarioEvent.EVENT_EXCLUIR, FuncionarioCommand );

			//TipoEventos
			this.addCommand( TipoEventoEvent.EVENT_PESQUISAR, TipoEventoCommand );
			this.addCommand( TipoEventoEvent.EVENT_INSERIR, TipoEventoCommand );
			this.addCommand( TipoEventoEvent.EVENT_EDITAR, TipoEventoCommand );
			this.addCommand( TipoEventoEvent.EVENT_EXCLUIR, TipoEventoCommand );

			//Ambulancias
			this.addCommand( AmbulanciaEvent.EVENT_PESQUISAR, AmbulanciaCommand );
			this.addCommand( AmbulanciaEvent.EVENT_INSERIR, AmbulanciaCommand );
			this.addCommand( AmbulanciaEvent.EVENT_EDITAR, AmbulanciaCommand );
			this.addCommand( AmbulanciaEvent.EVENT_EXCLUIR, AmbulanciaCommand );

			//Bancos
			this.addCommand( BancoEvent.EVENT_PESQUISAR, BancoCommand );
			this.addCommand( BancoEvent.EVENT_INSERIR, BancoCommand );
			this.addCommand( BancoEvent.EVENT_EDITAR, BancoCommand );
			this.addCommand( BancoEvent.EVENT_EXCLUIR, BancoCommand );
			
			//PerfilAcesso
			this.addCommand( PerfilAcessoEvent.EVENT_PESQUISAR, PerfilAcessoCommand );
			this.addCommand( PerfilAcessoEvent.EVENT_INSERIR, PerfilAcessoCommand );
			this.addCommand( PerfilAcessoEvent.EVENT_EDITAR, PerfilAcessoCommand );
			this.addCommand( PerfilAcessoEvent.EVENT_EXCLUIR, PerfilAcessoCommand );
			
			//EstadoCivil
			this.addCommand( EstadoCivilEvent.EVENT_PESQUISAR, EstadoCivilCommand );
			this.addCommand( EstadoCivilEvent.EVENT_INSERIR, EstadoCivilCommand );
			this.addCommand( EstadoCivilEvent.EVENT_EDITAR, EstadoCivilCommand );
			this.addCommand( EstadoCivilEvent.EVENT_EXCLUIR, EstadoCivilCommand );
			
			//Pagamentos
			this.addCommand( PagamentoEvent.EVENT_PESQUISAR, PagamentoCommand );
			this.addCommand( PagamentoEvent.EVENT_INSERIR, PagamentoCommand );
			this.addCommand( PagamentoEvent.EVENT_INSERIR_LOTE, PagamentoCommand );
			this.addCommand( PagamentoEvent.EVENT_EDITAR, PagamentoCommand );
			this.addCommand( PagamentoEvent.EVENT_EXCLUIR, PagamentoCommand );
			
			//Autorizacao
			this.addCommand( AutorizacaoPagamentoEvent.EVENT_AUTORIZACAO, AutorizacaoPagamentoCommand );
			
			//Caixa
			this.addCommand( CaixaEvent.EVENT_SALDO, CaixaCommand );

		}
	}
}