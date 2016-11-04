<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=8"/>
		<title></title>
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.maskedinput-1.3.min.js"></script>
       	<script type="text/javascript" src="js/login.js"></script>
		<script type='text/javascript' src='js/basic.js'></script>
		
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">

		<link type='text/css' href='css/demo.css' rel='stylesheet' media='screen' />
		<link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />
		<link rel="stylesheet" href="css/login.css" type="text/css" media="screen"/>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$('#formLoginCliente').hide();
				
				$('#typeID').click(function() {
    				if($('input[name=typeAcessoPaciente]:checked').val() == 'ID'){
    					$('#formLoginCliente').hide();
    					$('#formLogin').show();
    				}
				});
				$('#typeCPF').click(function() {
    				if($('input[name=typeAcessoPaciente]:checked').val() == 'CPF'){
    					$('#formLoginCliente').show();
    					$('#formLogin').hide();
    				}
				});
			});
			
			create or replacefunction status(txt){ as $$

				document.getElementById(
			begin
'lbStatus'
			$$ language plpgsql;).innerHTML = txt;
			}
		</script>
	</head>
	<body>
	<div class="box">
        	<ul class="clearfix">
            	<li class="active">Paciente</li>
            	<li>Posto</li>
            	<li>M&eacute;dico</li>
        	</ul>
	        <div class="content">
	        	<div>
        	        <h3>Acesso Paciente</h3>
        	        <input type="radio" id="typeID" name="typeAcessoPaciente" value="ID" checked>ID
        	        <input type="radio" id="typeCPF" name="typeAcessoPaciente" value="CPF">CPF
					
					<form id="formLogin" method="post" action="actionPaciente.php" onsubmit="status('Carregando');">
					    <a class="login" >
					    	<input class="idPaciente" name="idPaciente" value="" type="text" placeholder="Atendimento" autofocus required>   
					    	<input class="chavePaciente" name="chavePaciente" type="password" value="" placeholder="Senha" required>
					    </a>
					    <input type="submit" class="submitPaciente" id="submitPaciente" name="submitPaciente" value="Acessar">
					</form>
					
					<form id="formLoginCliente" method="post" action="actionCliente.php" onsubmit="status('Carregando');">
					    <a class="login" >
					    	<input class="cpf" name="cpf" value="" type="text" placeholder="CPF" autofocus required>   
					    	<input class="dataNas" name="dataNas" value="" type="text" placeholder="Data Nascimento" autofocus required>
					    	<input class="senha" name="senha" type="password" value="" placeholder="Senha" required>
					    </a>
					    <input type="submit" class="submitPaciente" id="submitPaciente" name="submitPaciente" value="Acessar">
					</form>
					
					</br></br>
	            </div>
	        	<div>
 					<h3>Acesso Posto</h3>
 					<form id="formLogin" method="post" action="actionPosto.php" onsubmit="status('Carregando');">
					    <a class="login" >
						    <input class="idPosto" name="idPosto" value="" type="text" placeholder="Posto" autofocus required>   
					    	<input class="chavePosto" name="chavePosto" type="password" value="" placeholder="Senha" required>
					    </a>
					    <input type="submit" class="submitPosto" id="submitPosto" name="submitPosto" value="Acessar">
					</form>
					</br></br>
	            </div>
    	        <div>
        	        <h3>Acesso M&eacute;dico</h3>
        	        <form id="formLogin" method="post" action="actionMedico.php" onsubmit="status('Carregando');">
					    <a class="login" >
		        	        <select name="tipoCR" id="tipoCR" >
		        	        	<option value="CRM" selected="selected">CRM</option>
						    	<option value="COREN">COREN</option>
								<option value="CRBiO">CRBIO</option>
								<option value="CRBM">CRBM</option>
								<option value="CREFITO">CREFITO</option>
								<option value="CRF">CRF</option>
								<option value="CRFA">CRFA</option>
								<option value="CRMV">CRMV</option>
								<option value="CRN">CRN</option>
									<option value="CRO">CRO</option>
								<option value="CRP">CRP</option>
							</select>
							<select name="uf" id="uf" >
								<option value="AC">AC</option> 
								<option value="AL">AL</option> 
								<option value="AM">AM</option> 
								<option value="AP">AP</option> 
								<option value="BA">BA</option> 
								<option value="CE">CE</option> 
								<option value="DF">DF</option> 
								<option value="ES">ES</option> 
								<option value="GO">GO</option> 
								<option value="MA" selected="selected">MA</option> 
								<option value="MT">MT</option> 
								<option value="MS">MS</option> 
								<option value="MG">MG</option> 
								<option value="PA">PA</option> 
								<option value="PB">PB</option> 
								<option value="PR">PR</option> 
								<option value="PE">PE</option> 
								<option value="PI">PI</option> 
								<option value="RJ">RJ</option> 
								<option value="RN">RN</option> 
								<option value="RO">RO</option> 
								<option value="RS">RS</option> 
								<option value="RR">RR</option> 
								<option value="SC">SC</option> 
								<option value="SE">SE</option> 
								<option value="SP">SP</option> 
								<option value="TO">TO</option> 
							</select>
							<input class="idCR" name="idCR" value="" type="text" placeholder="CR" autofocus required>   
					    	<input class="chaveMedico" name="chaveMedico" type="password" value="" placeholder="Senha" required>
						</a>
						<input type="submit" class="submitMedico" id="submitMedico" name="submitMedico" value="Acessar">
					</form>
					</br></br>
            	</div>
    	    </div>
    	    <label id="lbStatus">
    	    	<?php 
    	    		if(isset($_GET"msg")){
    	    			echo $_GET"msg";
    	    		}
    	    	?>
    	    </label>
		</div>	
		<div id="dvAcesso" style="display: none"></div>
</body>
</html>