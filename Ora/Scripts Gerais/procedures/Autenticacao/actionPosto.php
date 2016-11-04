<?php
	ini_set('display_errors', 1);
	$xmlConfig = simplexml_load_file('../config.xml');
	
	if ($_POST) {
		$url = $xmlConfig->URL_JSON . $xmlConfig->GET_ACESSO_POSTO . $_POST['idPosto'] . '/' . $_POST['chavePosto'];
		
		$show = json_decode(file_get_contents($url));
		
		if($show->result[0]->Action == "actOK"){
			echo '<form style="display:none" target="_parent" id="formApp" name="formApp" action="'.$xmlConfig->URL_APP_POSTO.'" method="post">
		     <input type="text" name="idPosto" id="idPosto" value="'.$_POST["idPosto"].'" /><br/>
		     <input type="text" name="chavePosto" id="chavePosto" value="'.$_POST["chavePosto"].'"/><br/>
		     <input type="submit" value="submit"/>
		  	</form>';
			
			echo '<script language="javascript" type="text/javascript">
						document.formApp.submit(); 
     			  </script>';
		}else{
			header("Location: index.php?msg=" . $show->result[0]->Msg);
		}
	}
?>