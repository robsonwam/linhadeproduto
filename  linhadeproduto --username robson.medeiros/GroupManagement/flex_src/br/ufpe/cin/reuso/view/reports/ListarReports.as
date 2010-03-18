package br.com.r2jm.sauderesidencia.view.reports
{
	
	import org.doc.PaperFormat;
	import org.doc.Document;
	import mx.managers.PopUpManager;
	import mx.collections.ArrayCollection;
	
	public class ListarReports
	{
		public function ListarReports()
		{
		}
		
		

		    [Bindable]
		    private var _financas:ArrayCollection = new ArrayCollection([
		       {Mes:"Janeiro", Receitas:2000, Despesas:1500},
		       {Mes:"Fevereiro", Receitas:1000, Despesas:200},
		       {Mes:"Março", Receitas:1500, Despesas:500},
		       {Mes:"Abril", Receitas:500, Despesas:300},
		       {Mes:"Maio", Receitas:1000, Despesas:450},
		       {Mes:"Junho", Receitas:2000, Despesas:500}
		    ]);
		    
		    [Bindable]
		    private var _totalReceitas:int = 8000;
		    
		    [Bindable]
		    private var _totalDespesas:int = 2450;
		    
		    private function imprimirClickHandler(event:MouseEvent):void
		    {
		    	var janela:PreviewWindow = new PreviewWindow();
		    	janela.width = this.width;
		    	janela.height = this.height;
		    	
		    	var dp:DPTemplateFinancas = new DPTemplateFinancas();
		    	dp.financas = this._financas;
		    	dp.totalReceitas = this._totalReceitas;
		    	dp.totalDespesas = this._totalDespesas;
		    	dp.resultado = this._totalReceitas - this._totalDespesas;
		    	
		    	var doc:Document = new Document( new TemplateLista(), dp, PaperFormat.A4);
		    	
		    	PopUpManager.addPopUp(janela, this, true);
		    	
		    	janela.previewComponent.doc = doc;
		    }

	}
}