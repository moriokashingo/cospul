
$(function() {


    var search_list = $(".tags__search__result");
    var selected_list = $(".tags__search__add");
　　//検索に合致するtagを表示
    function appendList(tag) {
      var html = `<div class="cospul__candidate__tag clearfix">
                    <p class="chat-cospul-tag__name">${ tag.name }</p>
                    <div class="tag-search-add chat-cospul-tag__btn chat-cospul-tag__btn--add" data-tag-id="${ tag.id}" data-tag-name="${ tag.name }">追加</div>
                  </div>`
      search_list.append(html)
    }

　　//検索後、選択されたtagをタグリストに追加
    function appendtag(name, tag_id) {
      var html = `<div class='cospul__new-tag' id='newtag'>
                    <input name='cospul[tag_ids][]' type='hidden' value='${ tag_id }'>
                    <p class='chat-cospul-tag__name'>${ name }</p>
                    <div class='js-remove-btn'>削除</div>
                  </div>`
      selected_list.append(html)
    }

//追加ボタンが押されたときの処理
    $(function () {
      $(document).on("click", '.tag-search-add', function () {
          var name = $(this).attr("data-tag-name");
          var tag_id = $(this).attr("data-tag-id");
          $(this).parent().remove();
          appendtag(name, tag_id);
      });
    });

    $(selected_list).on("click", '.js-remove-btn', function() {
      $(this).parent().detach();
    });

    $(".tags__search__field").on("keyup paste", function() {
      var input = $(".tags__search__field").val();
      $.ajax({
        type: 'GET',
        url: '/tags',
        data: { keyword: input},
        dataType: 'json'
      })

      .done(function(tags,tag_lat) {
        $(search_list).empty()
        if (input.length !== 0){
          if(tags.length !== 0) {
            //tag検索し、合致するtagを表示。後にグループに追加するtagを選択する際に使うidにtag.idを指定
            $.each(tags, function(i, tag) {
              appendList(tag);
            })
          } else {
            $(search_list).empty();
            newTagAppendList();
          }
        }  else  {
        $(search_list).empty();
        }
      })

      .fail(function() {
        alert('ユーザー検索に失敗しました');
      })
    });
  });