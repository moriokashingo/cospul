
$(function() {
  var count = 0;
  var accessories_list = $("#accessories-add");

    function appendList() {
      var html =  ` <input placeholder="アクセサリーやその他の情報を入力してください。
                    "name="cospul_detail[accessories_attributes][${ count }][name]"
                    id="cospul_detail_accessories_attributes_${ count }_name",class="mt30">
                    <div class='tag-search-remove chat-cospul-tag__btn chat-cospul-tag__btn--remove js-remove-btn',id="delete">削除</div>`
      count = count + 1
      accessories_list.append(html)
    }


    $(accessories_list).on("click", '.js-remove-btn', function() {
      $(this).prev().remove();
      $(this).remove();
    });


    $("#accessories-add p").on("click", function() {
      appendList()
    });
  });