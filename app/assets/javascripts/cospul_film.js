$(function(){
    var duration = 300;
    var $cospul  = $('.cospul__list');
    var $film    = $('.cospul__list__text');
    var $picture = $('.cospul__list__picture')
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
