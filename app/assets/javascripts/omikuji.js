$(function () {

initScene1();

function initScene1 () {

        $container       = $('.omikuji__body__inner'),
        $title            = $('.omikuji__body__title'),
        $images          = $container.find('img'),

        frameLength      = $images.length,
        currentFrame     = 0,
        counter          = 0,
        velocity         = 0,
        timer            = null,
        imageAspectRatio = 864 / 486;

    $container.on('mousewheel', function (event, delta) {
        if (delta < 0) {
            velocity += 1.5;
        } else if (delta > 0) {
            velocity -= 1.5;
        }
        startAnimation();
    });

    function startAnimation () {
        if (!timer) {
              // 1/60 秒ごとに更新
            timer = setInterval(animateSequence, 1000 / 30);
        }
    }

    function stopAnimation () {
        clearInterval(timer);
        timer = null;
        $title.html('<h2>もうこれでええやん</h2>')


    }

    function animateSequence () {
        $title.html('<h2>もう衣装なんてスクロールして適当に決めたらいいやん</h1>')
        var nextFrame;
          velocity *= 0.9;
        if (-0.01 < velocity && velocity < 0.01) {
            stopAnimation();
        } else {
            counter = (counter + velocity) % frameLength;
        }
        nextFrame = Math.floor(counter);
        if (currentFrame !== nextFrame) {
            $images.eq(nextFrame).show();
            $images.eq(currentFrame).hide();
            currentFrame = nextFrame;
        }
    }
    }

});
