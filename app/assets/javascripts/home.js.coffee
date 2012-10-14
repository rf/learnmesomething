# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.autocomplete = []

$ ->
  container = $("#questions")

  ($ '#search').keyup ->

    text = ($ '#search').attr 'value'

    if(text && text.length)
      $.get "search/#{encodeURIComponent text}", livesearch
    else
      container.html("")

  ($ "#ajax-search-form").bind "ajax:success", (evt, data, status, xhr) ->
    livesearch($.parseJSON(xhr.responseText))

  livesearch = (questions) ->
    if(questions.length)
      container.html("")

      for question in questions
        container.append("<div class='row collapse'><div class='two columns'>#{question.total_votes}</div><div class='ten columns'><a href='#{question.relative_path}'><h3>#{question.title}</h3></a></div></div>")
    else
      container.html("No suggestions")
