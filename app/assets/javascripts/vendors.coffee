# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # $('#vendor_update').on 'click', ->

  $('#open_vendor_form').on 'click', ->
    $('#open_vendor_form').addClass 'hide'
    $('#vendor_form').removeClass 'hide'

  $('#close_vendor_form').on 'click', ->
    $('#vendor_form').addClass 'hide'
    $('#open_vendor_form').removeClass 'hide'


  $('select').material_select()
