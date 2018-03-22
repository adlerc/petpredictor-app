
$('document').ready(function(){

  $('#disagree_button').click(function(){
    var tmp = $("#dog_count").val();
    $("#dog_count").val($("#cat_count").val());
    $("#cat_count").val(tmp);
    $("#correct").val("false");
    $("#predictorform").submit();
  });

  $('#playagain').click(function(){
    location.replace("/petpredictor");
  });

  $("#predictorform").submit(function() {
    var stopsubmit = false;

    if($('#height').val() == "") {
      errorfield('#height-form');
      stopsubmit=true;
    }else{
      clearfield('#height-form');
    }
    if($('#weight').val() == "") {
      errorfield('#weight-form');
      stopsubmit=true;
    }else{
      clearfield('#weight-form');
    }
    if(stopsubmit) return false;
  });  

  function errorfield(field){
    $(field).addClass('formgroup-error');
  }

  function clearfield(field){
    $(field).removeClass('formgroup-error');
  }

});
