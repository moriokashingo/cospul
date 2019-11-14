$(function () {

  // プレビューファイルの読み込み等
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        var prev = $('#upload__file__previews').find('#icon__img__prev');
        $(prev).attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }


//ファイルが決まった後
  $(document).on('change', '#icon__img',function(event) {
    readURL(this);
    });
  });