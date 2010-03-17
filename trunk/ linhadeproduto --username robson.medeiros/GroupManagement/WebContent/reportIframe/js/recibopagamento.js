$(function(){ 
	gerarRelatorioRecibo(); 
});

function gerarRelatorioRecibo()
{
	var variaveis = location.search.split("?");
	var quebra    = variaveis[1].split("=");
	var dados     = JsonToArray(quebra[1]).PAGAMENTOS;
	var template  = "";
	var registroPorPagina = 15;
	for(var i=0; i< dados.length; i++ )
	{
		var totalPagamentos = dados[i].ITENS_PAGAMENTO.length;
		var qtdPaginas = Math.ceil(totalPagamentos / registroPorPagina);
		var indiceArray = 0;
	                         
        for(var pag=0; pag < qtdPaginas ;pag++)
		{
        	var total = 0;
			template += "<div class='Recibo'>";
			template += "  <div class='DivHeader'>";
			template += "    <table>";
			template += "    <tr>";
			template += "      <td class='Titulo1'>Recibo de Pagamento</td>";
			template += "      <td class='Titulo2'>SAÚDE RESIDÊNCIA</td>";
			template += "      <td class='Titulo3'><span>"+ dados[i].DATA_HORA+"</span></td>";
			template += "    </tr>";
			template += "    </table>";
			template += "  </div>";
			
	   	    template += "  <div class='DivBody'>";
		    
			template += "    <div class='Dados'>";
			template += "      <span class='Matricula'>Mátricula:</span><span>"+ dados[i].MATRICULA + "</span>";
			template += "      <span class='Nome'>Nome:</span><span>"+ dados[i].NOME_FUNCIONARIO +"</span>";
			template += "    </div>";
			
			template += "    <table class='TabelaRecibo'>";
			template += "    <thead>";
			template += "    <tr>";
			template += "      <th class='Titulo1' width='15%'>Cód. Evento</th>";
			template += "      <th class='Titulo2' width='65%'>Descrição verba</th>";
			template += "      <th class='Titulo3' width='20%'>Valor (R$)</th>";
			template += "    </tr>";
			template += "    </thead>";
			template += "    <tbody>";
		
				//for(var x=0; x< dados[i].ITENS_PAGAMENTO.length ;x++)
				for(var x=0; x < registroPorPagina; x++) 	
				{
					if(indiceArray < dados[i].ITENS_PAGAMENTO.length)
					{
						template += "<tr>";
						template += "<td>" + dados[i].ITENS_PAGAMENTO[indiceArray].EVENTO_ID       + "</td>";
						template += "<td>" + dados[i].ITENS_PAGAMENTO[indiceArray].DESCRICAO_VERBA + "</td>";
						template += "<td style='text-align:right;'> R$ " + dados[i].ITENS_PAGAMENTO[indiceArray].VALOR       + "</td>";
						template += "</tr>";
						total = total + parseFloat(dados[i].ITENS_PAGAMENTO[indiceArray].VALOR);
					}else{
					    template += "<tr>";
					    template += "<td>&nbsp;</td>";
					    template += "<td>&nbsp;</td>";
					    template += "<td>&nbsp;</td>";
					    template += "</tr>";
					    //total = total + parseFloat(dados[i].ITENS_PAGAMENTO[indiceArray].VALOR);
					}
					indiceArray++;
				}
				
			template += "  </tbody>";
			
			template += "    <tfoot>";
			template += "    <tr>";
			template += "      <td colspan='2' class='Total'>Total</td>";
			template += "	   <td style='text-align:right;'> R$ "+ total.toFixed(2); +"</td>";
			template += "    </tr>";
			template += "    </tfoot>";
			
			template += "    </table>";
			template += "  <div class='DivFooter'>";
			template += "     <div class='Titulo1'>Confirmo os valores acima</div>";
			template += "     <div class='Titulo2'>";
			template += "        <span class='DataAtual'>Data:</span><span>"+ dados[i].DATA_HORA+"</span>";
			template += "        <span class='Funcionario'>Funcionário:</span><span>_________________________________________</span>";
			template += "     </div>";
			template += "  </div>";
			
			template += " </div>";
			template += "</div><br><br>";	
		}
	}
	
	$set('ReciboPagamento',template);
}