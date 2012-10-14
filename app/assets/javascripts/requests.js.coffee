# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

fetchResponses = (target) ->
  $.get target, (data) ->
    $('#responses').html(data)

$(document).ready ->
  form = $("form#new_response")
  target = form.attr('action')

  fetchResponses(target)

  form.bind('ajax:success', ->
    return fetchResponses(target)
  ).bind('ajax:error', (evt, xhr, status, error) ->
    console.log(JSON.parse(xhr.responseText))
  )

  $('#tags').tagsInput({ 'interactive':true, 'defaultText':'add a tag'})
