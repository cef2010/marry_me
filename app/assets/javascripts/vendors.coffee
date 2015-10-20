# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  baseUrl = '/vendors/'
  vendor = $('.vendor_display')
  headline = $('.headline')
  #update vendor

  $(".dropdown-button").dropdown();

  $('#open_vendor_form').on 'click', ->
    $('#open_vendor_form').addClass 'hide'
    $('#vendor_form').removeClass 'hide'
    $('#vendor_info').addClass 'hide'

  $('#close_vendor_form').on 'click', ->
    $('#vendor_form').addClass 'hide'
    $('#open_vendor_form').removeClass 'hide'
    $('#vendor_info').removeClass 'hide'

  # $('.vendor_update').on 'click', ->
  #   valuesToSubmit = $('.form_for_vendor').serialize()
  #   debugger
  #   $.ajax baseUrl + $(this).data('id'),
  #     type: 'PUT'
  #     data: valuesToSubmit
  #     success: (data) ->
  #       $('.vendor_name').html(data.vendor.name)
  #       $('.vendor_desc').html(data.vendor.description)
  #       $('.vendor_type').html(data.vendor.type)
  #       $('.vendor_address').html(data.vendor.address)
  #       $('.vendor_website').html(data.vendor.website)
  #       $('.vendor_phone').html(data.vendor.phone)
  #     error: (data) ->
  #       console.log data
        #how to convert data.vendor.type to symbol b/c vendor params is expecting symbol in require

#AJAX requests for vendor types

  $('.vendor_button').click ->
    vendor_category = $(this).data('category')
    vendors = $('.current_vendors')
    $.ajax '/sort_by_type',
      type: 'GET'
      data:
        category: vendor_category
      success: (data) ->
        vendors.empty()
        vendors.html(data)
        headline.empty()
        headline.html(vendor_category + 's')

      error: (data) ->






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
