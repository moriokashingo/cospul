$(function() {
    $(".omikuji").on("click", function() {
      var id = $(this).data("id");
      if (confirm('ページ遷移しますか？')) {
        window.location.href = `/cospuls/${id}`;
      }
    });
  });