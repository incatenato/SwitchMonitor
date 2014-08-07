$(function(){
    $.post("/add.html",{firstName:"Jiang",lastName:"Hao"},function(data){
        $("#inner").html(data);
    })
})
