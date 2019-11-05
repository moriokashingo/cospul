
$(function() {
  //メインページの回るサイドバーのJS
  //2019/10/24htmlとbodyにovrescroll:hiddenが掛かって行って他のところにかけたり、
  // jsでトップページだけかけても動かなかった。なので、トップページ以外はoverflow:scrollするようにした。
  $(window).on("load", function(){
    if($('.main-page').length || $('.login-page').length ) {
    }else{
      $('html').css('overflow','scroll');
      $('body').css('overflow','scroll');
    }
  });
  var $page = $('.main-page');
  $('.menu_toggle').on('click',function(){
    $page.toggleClass('real');
  });

  $('.main-page__content').on('click',function(){
    $page.removeClass('real');
  });
})

