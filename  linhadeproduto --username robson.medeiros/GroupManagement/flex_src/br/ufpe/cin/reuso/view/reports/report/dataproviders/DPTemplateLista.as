package br.ufpe.cin.reuso.view.reports.report.dataproviders
{
	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;
	import mx.collections.SortField;
	import mx.collections.Sort;

	public class DPTemplateLista
	{
		public var dtGrid:DataGrid = null;
		public var dpLista:ArrayCollection = null;
		public var titulo:String = "";
		public var ordenacao:Array = [];

		//public var dataSortField:SortField = null;

		public function DPTemplateLista()
		{

		}
	}
}