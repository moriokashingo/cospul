$(function(){
  // サイドバー動くやつのjs
var duration = 300;

  // aside ----------------------------------------
var $aside = $('aside');
var $asidButton = $aside.find('button')

$asidButton.on('click', function(){
        $aside.toggleClass('open');
        if($aside.hasClass('open')){
            $aside.stop(true).animate({left: '-70px'}, duration);
        }else{
            $aside.stop(true).animate({left: '-300px'}, duration);
        };
    });

});
