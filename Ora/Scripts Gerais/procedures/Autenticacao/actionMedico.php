<?php
	ini_set('display_errors', 1);
	$xmlConfig = simplexml_load_file('../config.xml');
	
	if ($_POST) {
		$url = $xmlConfig->URL_JSON . $xmlConfig->GET_ACESSO_MEDICO . $_POST['tipoCR'] .'/'. $_POST['uf'] .'/'. $_POST['idCR'] . '/' . $_POST['chaveMedico'];
		
		$show = json_decode(file_get_contents($url));
		
		if($show->result[0]->Action == "actOK"){
			echo '<form style="display:none" target="_parent" id="formMedico" name="formMedico" action="'.$xmlConfig->URL_APP_MEDICO.'" method="post">
		     <input type="text" name="tipoCR" id="tipoCR" value="'.$_POST["tipoCR"].'"/><br/>
		     <input type="text" name="uf" id="uf" value="'.$_POST["uf"].'"/><br/>
		     <input type="text" name="idCR" id="idCR" value="'.$_POST["idCR"].'"/><br/>
		     <input type="text" name="chaveMedico" id="chaveMedico" value="'.$_POST["chaveMedico"].'"/><br/>
		     <input type="submit" value="submit"/>
		  	</form>';
			
			echo '<script language="javascript" type="text/javascript">
						document.formMedico.submit(); 
     			 </script>';
		}else{
			header("Location: index.php?msg=" . $show->result[0]->Msg);
		}
	}
?>