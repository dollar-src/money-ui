
dollar = {}; 


$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
        dollar.CloseAyarMenu();
            break;
    }
});

dollar.CloseAyarMenu = function() {
    $(".login-wrap").css({"display":"none"});
    $.post('https://money-ui/CloseMenu:NuiCallback',JSON.stringify({data: true}));
};




window.addEventListener('message', function(event) {
    eFunc = event.data
    var item = event.data
    $(".getplayermoney").html(eFunc.currentitemamount + " $")
    if (eFunc.action == "showui") {
        $('body').show()
        $(".login-wrap").css({"display":"none"});
    } else if (eFunc.action == "hideui") {
        $("body").fadeOut(500)
        $(".login-wrap").css({"display":"none"});
    } else if (eFunc.action == "userpanelui") {
        $(".login-wrap").css({"display":"block"});

    }
    


})


$(document).on('click', '#buttonprog', function() {
    var x = document.getElementById("monee").value;
    var fee = x / 100 * 25
    var totalexchange = x - fee
 
    $.post('https://money-ui/dollar:sa', JSON.stringify({
        input: x
        
     
        
    }))
    dollar.CloseAyarMenu();
    



});


 $("#monee").change(function(){
    var x = document.getElementById("monee").value;
   var fee = x / 100 * 25
   var totalexchange = x - fee
   document.getElementById("buttonprog").value = "Total " + " "+ totalexchange + " "+ '(With Fees)';

   console.log(totalexchange)
});






