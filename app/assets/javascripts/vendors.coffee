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

  # initMap = ->
  #   myLatLng = {lat: document.getElementById('lat').val(), lng: document.getElementById('lng').val()}
  #
  #   map = new google.maps.Map(document.getElementById('map'), {
  #     zoom: 12,
  #     center: myLatLng
  #   });
  #
  #   marker = new google.maps.Marker({
  #     position: myLatLng,
  #     map: map,
  #     title: 'Hello World!'
  #   });

  # handler = Gmaps.build('Google')
  # handler.buildMap {
  #   provider: {}
  #   internal: id: 'map'
  # }, ->
  #   markers = handler.addMarkers([  {
  #       "lat": 0
  #       "lng": 0
  #       "picture":
  #         "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
  #         "width":  36
  #         "height": 36
  #       "infowindow": "hello!"
  #   }   ])
  #   handler.bounds.extendWith markers
  #   handler.fitMapToBounds()
  #   return
