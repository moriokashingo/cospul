$(function(){
    $('#ss').click(function(){
      var speed = 500;
      $(".content_inner").animate({scrollTop:0}, speed, "swing");
    });
  });