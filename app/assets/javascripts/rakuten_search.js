
$(function() {

  var search_list = $(".rakuten__box__result__lists");

  function appendList(item) {
    var item_price = (String(item.price).replace(/\B(?=(\d{3})+(?!\d))/g, ','));
    var html =  `<tr>
    <td>
    <img src="${item.small_image_urls[0]}">
    </td>
    <td><a href="${item.url}">"${item.name}"</a></td>
    <td>
    "${item_price}"
    円
    </td>
    </tr>`
    search_list.append(html)
  }


  $("#rakuten_submit").on("click", function() {
    var input = $("#rakuten_search").val();
    $.ajax({
      type: 'GET',
      url: '/rakuten_index',
      data: { keyword: input},
      dataType: 'json'
    })

    .done(function(items) {
      $(search_list).empty()
      if (input.length !== 0 && items.length !== 0){
        $.each(items, function(i,item) {
          appendList(item);
        })
      }  else  {
      $(search_list).empty();
      }
    })

    .fail(function() {
      alert('楽天検索に失敗しました');
    })
  });
});