package br.ufpe.cin.reuso.control
{
	
	import br.ufpe.cin.reuso.commands.GrupoPesquisaCommand;
	import br.ufpe.cin.reuso.commands.LoginCommand;
	import br.ufpe.cin.reuso.commands.MembroCommand;
	import br.ufpe.cin.reuso.commands.PublicacaoCommand;
	import br.ufpe.cin.reuso.commands.TipoCommand;
	import br.ufpe.cin.reuso.commands.VisitanteCommand;
	import br.ufpe.cin.reuso.events.GrupoPesquisaEvent;
	import br.ufpe.cin.reuso.events.LoginEvent;
	import br.ufpe.cin.reuso.events.MembroEvent;
	import br.ufpe.cin.reuso.events.PublicacaoEvent;
	import br.ufpe.cin.reuso.events.TipoEvent;
	import br.ufpe.cin.reuso.events.VisitanteEvent;
	
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

			//GrupoPesquisa
			this.addCommand( GrupoPesquisaEvent.EVENT_PESQUISAR, GrupoPesquisaCommand );
			this.addCommand( GrupoPesquisaEvent.EVENT_INSERIR, GrupoPesquisaCommand );
			this.addCommand( GrupoPesquisaEvent.EVENT_EDITAR, GrupoPesquisaCommand );
			this.addCommand( GrupoPesquisaEvent.EVENT_EXCLUIR, GrupoPesquisaCommand );
			
			//Visitante
			this.addCommand( VisitanteEvent.EVENT_PESQUISAR, VisitanteCommand );
			this.addCommand( VisitanteEvent.EVENT_INSERIR, VisitanteCommand );
			this.addCommand( VisitanteEvent.EVENT_EDITAR, VisitanteCommand );
			this.addCommand( VisitanteEvent.EVENT_EXCLUIR, VisitanteCommand );
			
		}
	}
}