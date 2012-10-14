# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.autocomplete = []

$ ->
  container = $("#questions-autocomplete")

  ($ '#search').keyup ->

    text = ($ '#search').attr 'value'

    if(text && text.length)
      $.get "search/#{encodeURIComponent text}", livesearch
    else
      container.html("")
      $('ul#questions-autocomplete').hide()


  ($ "#ajax-search-form").bind "ajax:success", (evt, data, status, xhr) ->
    livesearch($.parseJSON(xhr.responseText))

  livesearch = (questions) ->
    $('ul#questions-autocomplete').show()
    if(questions.length)
      container.html("")

      for question in questions
        container.append("<a href='#{question.relative_path}'><li class='row collapse'><div class='ten columns'><h4>#{question.title}</h4><p>#{question.description.substring(0, 20)}</p><p>Requested by #{question.user_email}</p></div><div class='two columns'>#{question.total_votes} votes</div></li></a>")
    else
      container.html("No suggestions")
