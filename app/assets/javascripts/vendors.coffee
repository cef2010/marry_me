# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  baseUrl = '/vendors/'
  vendor = $('.vendor_display')
  headline = $('.headline')
  vendor_tab_select= $('#tabs').tabs('select_tab', '#vendor_info_link');

  $(document).on 'click', '#vendor_map_link', ->
    $('#map_vendors').removeClass('hide')
    $('#vendors').addClass('hide')
    mapHash = $(this).data('map-hash')
    handler = Gmaps.build('Google')
    handler.buildMap {
      provider: {}
      internal: id: 'map'
      }, ->
        markers = handler.addMarkers(mapHash)
        handler.bounds.extendWith markers
        handler.fitMapToBounds()

  $(document).on 'click', '#vendor_info_link', ->
    $('#map_vendors').addClass('hide')
    $('#vendors').removeClass('hide')

  $(".dropdown-button").dropdown();

  $('#open_vendor_form').on 'click', ->
    $('#open_vendor_form').addClass 'hide'
    $('#vendor_form').removeClass 'hide'
    $('#vendor_info').addClass 'hide'
    $('#vendor_avatar').addClass 'hide'
    $('.vendor_show_info').addClass 'hide'

  $('#close_vendor_form').on 'click', ->
    $('#vendor_form').addClass 'hide'
    $('#open_vendor_form').removeClass 'hide'
    $('#vendor_info').removeClass 'hide'
    $('#vendor_avatar').removeClass 'hide'
    $('.vendor_show_info').removeClass 'hide'


  $(document).on 'click', '.vendor_button', ->
    vendor_category = $(this).data('category')
    vendor_map = $('#map_vendors')
    vendor_info = $('#vendor_info_link')
    $('#map_vendors').addClass('hide')
    $('#vendors').removeClass('hide')
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
        $('ul.tabs').tabs();
      error: (data) ->

  $('select').material_select()
