App.chat_message = App.cable.subscriptions.create "ChatMessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    div = document.createElement 'div'
    div.innerText = data['message']
    document.querySelector('#chat_messages').appendChild div
    # Called when there's incoming data on the websocket for this channel

  speak:(message) ->
    @perform 'speak', message: message

document.addEventListener 'keypress', (event) ->
  if event.target.dataset.behavior is "speak_chat_messages" && event.keyCode is 13
    App.chat_message.speak event.target.value
    event.target.value = ''
    event.preventDefault()