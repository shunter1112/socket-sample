ws = new WebSocket('ws://localhost:8888/')

ws.onerror = (e)->
  $('#chat-area').empty()
    .addClass('alert alert-error')
    .append(
    	'<button type="button" class="close" data-dismiss="alert">×</button>',
      $('<i/>').addClass('icon-warning-sign'),
      'サーバに接続できませんでした。'
    )

document.onkeydown = (e)->
	ws.send e.keyCode.toString()

ws.onmessage = (e)->
	$("h1").text(e.data)