<?php
	ini_set('display_errors', 1);
	$xmlConfig = simplexml_load_file('../config.xml');
	
	if ($_POST) {
		$id = explode("/", $_POST'idPaciente');
		$type = 'ID';
		
		$url = $xmlConfig->URL_JSON . $xmlConfig->ACESSO_ATENDIMENTO . $id0'/'. $id1 .'/'. $_POST'chavePaciente';
		
		
		$show = json_decode(file_get_contents($url));
		
		if($show->result0->Action == "actOK"){
			echo '<form style="display:none" target="_parent" id="formApp" name="formApp" action="'.$xmlConfig->URL_APP_PACIENTE.'" method="post">
		     <input type="text" name="postoP" id="postoP" value="'.$id0'" /><br/>
		     <input type="text" name="atendimentoP" id="atendimentoP" value="'.$id1'" /><br/>
		     <input type="text" name="senhaP" id="senhaP" value="'.$_POST"chavePaciente"'"/><br/>
		     <input type="text" name="type" id="type" value="'.$type.'" /><br/>
		     
			 <input type="text" name="cpf" id="cpf" value="" /><br/>
			 <input type="text" name="dataNas" id="dataNas" value="" /><br/>
			 <input type="text" name="senha" id="senha" value="" /><br/>
			 
		     <input type="submit" value="submit"/>
		  	</form>';
			
			echo '<script language="javascript" type="text/javascript">
						document.formApp.submit(); 
     			  </script>';
		}else{
			header("Location: index.php?msg=" . $show->result0->Msg);
		}
	}
?>