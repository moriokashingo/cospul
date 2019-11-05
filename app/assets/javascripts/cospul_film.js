$(function(){
    var duration = 300;
    var $cospul  = $('.index__cospul');
    var $film    = $('.index__cospul__text');
    var $picture = $('.index__cospul__picture')
    $cospul
        .on('mouseover', function(){
            $(this).find($film).stop(true).animate({opacity: 1}, duration);
            $(this).find($picture).stop(true).css({'filter': 'blur(2px)'});

        })
        .on('mouseout', function(){
            $(this).find($film).stop(true).animate({opacity: 0}, duration);
            $(this).find($picture).stop(true).css({'filter': 'blur(0px)'});
        });
});
