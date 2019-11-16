$(function () {
  function copyToClipboard() {
    $('body').append('<textarea id="currentURL" style="position:fixed;left:-100%;">'+location.href+'</textarea>');
    $('#currentURL').select();
    document.execCommand('copy');
    $('#currentURL').remove();
    alert("URLをコピーしました。");
  }
});