# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # $('#couple_update').on 'click', ->

  $('#close_couple_form').on 'click', ->
    $('#couple_form').addClass 'hide'
    $('#open_couple_form').removeClass 'hide'

  $('#open_couple_form').on 'click', ->
    $('#open_couple_form').addClass 'hide'
    $('#couple_form').removeClass 'hide'
