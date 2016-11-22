function build_html(data){
  var addedMessage =
    '<li class="chat__message">\
      <div class="chat__message__header">\
        <div class="chat__message__header--name">'+ data.nickname +'</div>\
        <div class="chat__message__header--time">'+ data.datetime +'</div>\
      </div>\
      <div class="chat__message--body">'+ data.body +'</div>\
    </li>';

  $('.chat__messages').append(addedMessage);
};

$(function(){
  $('#submit').on('click', function(e) {
    var now_url = $(location).attr('href');
    var message_body = $('#message_body').val();
    // new_message


    $('#message_body').val('');

    e.preventDefault();

    $.ajax({
      url: now_url + "/messages.json",
      type: "POST",
      dataType: 'json',
      // data: {message: {body: message_body}}
      data: { formData }

    }).done(function(data){
      build_html(data);
      console.log( 'SUCCESS', data );

    }).fail(function(xhr,status,error){
      console.log( 'ERROR', xhr,status,error );

    });

  });
});
