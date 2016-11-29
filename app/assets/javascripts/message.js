function build_html(data){
  var addedMessage =
    '<li class="chat__message">\
    <div class="chat__message__header">\
    <div class="chat__message__header--name">'
    + data.nickname +
    '</div>\
    <div class="chat__message__header--time">'
    + data.datetime +
    '</div>\
    </div>\
    <div class="chat__message--body">'
    + data.body +
    '</div>\
    </li>';

  var addedMessage2 =
    '<li class="chat__message">\
    <div class="chat__message__header">\
    <div class="chat__message__header--name">'
    + data.nickname +
    '</div>\
    <div class="chat__message__header--time">'
    + data.datetime +
    '</div>\
    </div>\
    <div class="chat__message--body">'
    + data.body +
    '<img src='+data.image+'></div>\
    </li>';

    if (data.image != null) {
      $('.chat__messages').append(addedMessage2);
    } else{
      $('.chat__messages').append(addedMessage);
    };
};


$(function(){
  $('#new_message').on('click', function(e) {
    e.preventDefault();

    var fd = new FormData($(this)[0]);

    var now_url = $(location).attr('href');
    var ajax_url = now_url + "/messages.json"

    $.ajax({
      url: ajax_url,
      type: "POST",
      dataType: 'json',
      data: fd,
      processData: false,
      contentType: false

    }).done(function(data){
      build_html(data);
      console.log(data);

      $("form")[0].reset();

    }).fail(function(xhr,status,error){
      console.log( 'エラー', xhr,status,error );

    });

  });
});





// 自動更新
function auto_added(data) {
  for (var i = 0; i < data.messages.length; i++) {
    var build_html =
    '<li class="chat__message">\
    <div class="chat__message__header">\
    <div class="chat__message__header--name">'
    + data.nickname +
    '</div>\
    <div class="chat__message__header--time">'
    + data.messages[i].created_at +
    '</div>\
    </div>\
    <div class="chat__message--body">'
    + data.messages[i].body +
    '</div>\
    </li>';

    if (data.messages[i].image.url != null) {
      $('.chat__messages').append(build_html, '<img src=' + data.messages[i].image.url + '>');

    } else {
      $('.chat__messages').append(build_html);

    };
  };
};

$(function(){
  var now_url = $(location).attr('href');
  var ajaxget_url = now_url + ".json";

  setInterval(function(){
    $.ajax({
        url: ajaxget_url,
        type: 'GET',
        dataType: 'json'
      })
      .done(function(data) {
        $('.chat__messages').empty();
        auto_added(data);
        console.log(data);
      })
      .fail(function() {
        console.log("非同期失敗");
      });
  },2500);
});
