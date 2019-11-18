$(function(){
    $('#ss').click(function(){
      var speed = 500;
      $(".main-page__content__inner").animate({scrollTop:0}, speed, "swing");
    });
  });