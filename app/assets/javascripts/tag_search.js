
$(function() {

  var search_list = $(".tag__candidate__box__inner");

  function appendList(tag) {
    var html =  `<li id="${ tag.id}"  class="tag__candidate" data-tag-id="${ tag.id}" data-tag-name="${ tag.name }">${ tag.name }</li>`
    search_list.append(html)
  }

  $(function () {
    $(document).on("click", '.tag__candidate', function () {
        var name = $(this).attr("data-tag-name");
        $("#search").val(name)
    });
  });

  $("#search").on("keyup paste", function() {
    var input = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/cospuls/search',
      data: { keyword: input},
      dataType: 'json'
    })

    .done(function(tags) {
      $(search_list).empty()
      if (input.length !== 0 && tags.length !== 0){
        $.each(tags, function(i, tag) {
          if(i <= 4) {
          appendList(tag);
          }
        })
      }  else  {
      $(search_list).empty();
      }
    })

    .fail(function() {
      alert('タグの検索に失敗しました');
    })
  });
});