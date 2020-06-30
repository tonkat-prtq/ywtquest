$(function(){
  $('.card-header').click(function(){
    var icon = $(this).find('.fa-chevron-down');
    // 本文がなく、アイコンがないcard-headerをクリックした時はundefinedが返されることを利用した
    if(icon[0] !== undefined) { 
      // thisをつけてクリックした要素にだけ効かせる。そうしないと全部の矢印にtoggleClassが効いてアニメーションしてしまう
      // findで.fa-chevron-downのついた要素を見つけ、そこにクラスを追加している
      // spined-iconというクラスでアニメーションをつけている
      $(this).find('.fa-chevron-down').toggleClass("spined-icon")
      console.log(icon[0])
    }
  });
});