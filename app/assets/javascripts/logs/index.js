$(function(){
  $('.card-header').click(function(){
    var icon = $(this).find('.fa-chevron-down');
    console.log(icon[0]);

    if(icon !== undefined) { // 本文がなく、アイコンがないcard-headerをクリックした時はundefinedが返されることを利用した
      console.log("true");
      $('.fa-chevron-down').toggleClass("spined-icon")
    } else {
      console.log("false");
    }
  });
});