
$(function() {
  var count = 0;
  var accessories_list = $(".new__accessories__box");

  $(window).on("load", function(){
    if(document.URL.match(/edit/) && document.URL.match(/cospul_details/)) {
      count = $(".old__accessories").length
    }
  });

  function inputDisplay(count) {
    if (count < 5){
      $("#accessories__add__btn").css({'display':'block',});
    }else{
      $("#accessories__add__btn").css({'display':'none',});
    }
  }

  function appendList() {
    var html =  ` <div class='new__accessories'>
                    <input placeholder="アクセサリーやその他の情報を入力してください。"name="cospul_detail[accessories_attributes][${ count }][name]"id="cospul_detail_accessories_attributes_${ count }_name",class="mt30">
                    <div class='new__accessories__remove-btn'>削除</div>
                  </div>`
    count += 1
    accessories_list.append(html)
    inputDisplay(count)
  }

  $(document).on("click", '.old__accessories__remove-btn', function() {
    id = $(this).data("id")
    var delete_accessories = $(this).parent().parent().find(`#cospul_detail_accessories_attributes_${id}__destroy`)
    delete_accessories.prop('value', "1");
    $(this).parent().remove();
    $(this).remove();
    count -= 1
    inputDisplay(count)
  });
  $(document).on("click", '.new__accessories__remove-btn', function() {
    $(this).parent().remove();
    $(this).remove();
    count -= 1
    inputDisplay(count)
  });


  $("#accessories__add__btn").on("click", function() {
    appendList()
  });

});
