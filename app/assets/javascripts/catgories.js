$(function(){
  $('.leftTag1').hover(function() {
    $(".category__parent--name").show();
    $(".category__child").hide();
    $(".category__grandchild").hide();
  }, function() { 
    $(".category__parent--name").hide();  
  });
});
$(function(){
  $('.category__parent--name').hover(function() {
    $(".category__child").hide();
    $(this).children().show();
    $(this).children().children().show();
  }, function() {
    $(this).children().children().hide();
  });
});
$(function(){
  $('.category__child--name').hover(function() {
    $(".category__grandchild").hide();
    $(this).children().show();
    $(this).children().children().show();
  }, function() {
    $(this).children().children().hide();
  });
});
