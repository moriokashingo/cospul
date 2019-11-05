$(function(){
  var slider =$('.owl__carousel__inner');
  var button =$('.owl__dot');

  $(button).on('click',function(){
  var i = $(this).data('image') ;
  $(slider).animate({left:-480 * i + 'px'},
  500,'swing');
  });
});
