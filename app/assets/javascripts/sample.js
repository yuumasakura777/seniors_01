



$(document).ready(function(){
  //flashを5秒間表示後消える
  $(".alert").fadeOut(5000);

  $(".show-follow a").click(function(){
    $("#follow-event").fadeIn;
  });
});
