//Mascaras
jQuery(function($){
	//Adiciono as mask para idPaciente -> ID do atendimento
	$(".idPaciente").mask("99/999999",{placeholder:"_"});
	$(".cpf").mask("999.999.999-99",{placeholder:"_"});
	$(".dataNas").mask("99/99/9999",{placeholder:"_"});
	
	//Removo da tela o spac
	$("#space").hide();
});

$(function () {
    $('.box').each(function() {
        var content = $(this).find('.content'),
            tab     = $('> ul li', this);
        $('div', content).eq(0).show();
        tab.click(function () {
            tab.removeClass('active');
            $(this).addClass('active');
            document.getElementById('lbStatus').innerHTML = '';
            $('div', content).hide().eq($(this).index()).show(); 
        });
    });
});