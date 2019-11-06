
$(function() {
  var pictures      = [];
  var inputs        = [];
  var input_area    = $('.upload__box');
  var count         = 0;
  var pictures_count;

  // 投稿ボタンのサイズ変更
  function dpboxSize(pictures_count ) {
    if (!pictures_count == 0){
      $(input_area).css({'display':'block',});
      $(input_area).css({'margin-left':'10px',});
      if ((pictures_count == 6)){
        $(input_area).css({'display':'none',});
      };
    }
  }

  // プレビューファイルの読み込み等
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var prev = $('#upload__file__previews').find('#cospul__img__prev');
        $(prev).attr('src', e.target.result);
        $('#upload__file__previews').removeAttr('id');
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

// cospuls/editの時だけdpboxSizeをビュー読み込み時行う。
  $(window).on("load", function(){
    if(document.URL.match(/edit/) && document.URL.match(/cospuls/)) {
      pictures_count = $('.edit__cospul__pictures__picture').length;
      dpboxSize(pictures_count);
      $("#post__img__last").prop('name', `cospul[cospul_pictures_attributes][${pictures_count + 1}][picture]`);
      count = parseInt(pictures_count + 2);
    }
  });
  if(document.URL.match(/new/) && document.URL.match(/cospuls/)) {
  }

//ファイルが決まった後
  $(document).on('change', '#post__img,#post__img__last',function(event) {
    var html = `<div class="hidden" id="upload__file__previews">
    <img src=" " class="edit__cospul__pictures__picture" id="cospul__img__prev" data-picture = ${pictures.length + 1}>
    <div class="cospul__pictures__btns">
      <a class="cospul__pictures__btns__edit" href="#" >編集</a>
      <a class="new__cospul__pictures__btns__delete" href="#" >削除</a>
    </div>
  </div>`
    inputs.push($(this));
    $('#upload__file__previews').removeClass('hidden');
    readURL(this);
    $('#upload__file__previews').addClass(`edit__cospul__pictures`);
    $('.upload__box').before(html);
    pictures.push(html);
    var new_input = $(`<input name="cospul[cospul_pictures_attributes][${count+1}][picture]" class="upload__box__input" data-picture= ${pictures.length} type="file" id="post__img" accept="picture/*">`);
    input_area.prepend(new_input);
    pictures_count = $('.edit__cospul__pictures__picture').length;
    dpboxSize(pictures_count);
    // 一番上のインプットだけ押せるように表示。
    $(input_area).children(":first").css({'display':'block'});
    // 選択したインプットの見た目を消す。
    $(this).css({'display':'none'});
    count += 1;
    });

// 新しく投稿した画像の削除ボタン（完成）
  $('body').on('click', ".new__cospul__pictures__btns__delete",  function(e) {
    e.preventDefault();
    var target = $(this).parent().parent();
    var target_picture= target.find('img');
    $.each(inputs, function(index, input){
      if ($(input).data('picture') == target_picture.data('picture')){
        $(input).remove();
        target.remove();
        pictures.splice(index, 1);
        inputs.splice(index, 1);
        if(inputs.length == 0) {
          $('#post__img__last,#post__img').attr({
            'data-picture': 0
          });
          $('#cospul__img__prev').attr({
            'data-picture': 0
          });
        }
      }
    })
    pictures_count = $('.edit__cospul__pictures__picture').length;
    dpboxSize(pictures_count);
  });

// もともとあるアイテムに対しての削除ボタン
  $('.old__cospul__pictures__btns__delete').click(function(e){
    e.preventDefault();
    id = $(this).data("id")
    var delete_picture = $(".hidden.delete__pictures__box").find(`#cospul_cospul_pictures_attributes_${id}__destroy`)
    delete_picture.prop('value', "1");
    $(this).parent().parent().hide();
    $(this).parent().parent().appendTo(".delete__picture__box");

//dpboxSizeのために消す
    var deleteimg = $(this).parent().parent().find('img');
    deleteimg.remove();
    pictures_count = $('.edit__cospul__pictures__picture').length;
    dpboxSize(pictures_count);
  });
});
