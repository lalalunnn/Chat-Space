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
  $('#new_message').on('submit', function(e) {

    var fd = new FormData($(this)[0]);

    var now_url = $(location).attr('href');
    var ajax_url = now_url + "/messages.json"

    e.preventDefault();

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

      // formのデータをクリアする
      $('#message_body').val('');

    }).fail(function(xhr,status,error){
      console.log( 'ERROR', xhr,status,error );

    });

  });
});
