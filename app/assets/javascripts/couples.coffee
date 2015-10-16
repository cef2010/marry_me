# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.datepicker').pickadate({
    selectMonths: true, 
    selectYears: 15
  });

  baseUrl = '/couples/'
  # $('#couple_update').on 'click', ->

  $('#close_couple_form').on 'click', ->
    $('#couple_form').addClass 'hide'
    $('#open_couple_form').removeClass 'hide'

  $('#open_couple_form').on 'click', ->
    $('#open_couple_form').addClass 'hide'
    $('#couple_form').removeClass 'hide'

  $('.couple_update').on 'click', ->
    valuesToSubmit = $('.edit_couple').serialize()
    $.ajax baseUrl + $(this).data('id'), #make dynamic
      type: 'PUT'
      data: valuesToSubmit
      success: (data) ->
        console.log data
        $('.the_name').html(data.couple.name)
        $('.couple_desc').html(data.couple.description)
        $('.couple_date').html(data.couple.wedding_date)
        $('.ceremony_location').html(data.couple.ceremony_location)
        $('.reception_location').html(data.couple.reception_location)
        $('.budget').html(data.couple.budget)
      error: (data) ->
        console.log data

      # success: (data) ->
      #   alert('Something went right')
      # error: (data) ->
      #   alert('Something went wrong')

    #       $('form').submit ->
    # valuesToSubmit = $(this).serialize()
    # $.ajax(
    #   type: 'POST'
    #   url: $(this).attr('action')
    #   data: valuesToSubmit
    #   dataType: 'JSON').success (json) ->
    #   console.log 'success', json
    #   return
    # false


  #  $('.edit').on('click', function() {
  #  var first = $('#first_name').val();
  #  var last = $('#last_name').val();
  #  var phone = $('#phone_number').val();
  #  var user = { user: {first_name: first, last_name: last, phone_number: phone }};
  #  $.ajax(baseUrl + $(this).data('user-id'),
  #         {
  #           type: 'PUT',
  #           data: user,
  #           success: function(data) {
  #             $('#edit_user').addClass('hide');
  #           }
  #         });
  #       $('#add_user').removeClass('hide');
  #       $('#edit_user').addClass('hide');
  # });



# $(document).ready(function(){
#   $(document).on('click', '.populate', function(){
#     $.ajax({
#       url: '/populator',
#       type: 'GET',
#       success: function(data){
#         $('#gem_demo_first_name').val(data.first_name)
#         $('#gem_demo_last_name').val(data.last_name)
#         $('#gem_demo_birthdate').val(data.birth_date)
#         $('#gem_demo_address').val(data.address)
#         $('#gem_demo_city').val(data.city)
#         $('#gem_demo_state').val(data.state)
#         $('#gem_demo_zip').val(data.zip)
#       },
#       error: function(data){
#       }
#     })
#   });
#
# });

# $(document).ready ->
#   $('.vote_button').click ->
#     $voteButton = $(this)
#     $.ajax $voteButton.data('url'),
#       type: 'PUT'
#       success: (data) ->
#         $('#' + $voteButton.data('element-id')).html(data.value)
#       error: (data) ->
#         alert('Something went wrong')
#
#
# <h1> Votes </h1>
# <h3> Number of Up Votes:
#   <span id="upvotes"> <%= @upvotes %> </span>
# </h3>
# <h3> Number of Down Votes:
#   <span id="downvotes"> <%= @downvotes %> </span>
# </h3>
# <hr>
# <button class="vote_button" data-url="/upvote" data-element-id="upvotes">Up Vote</button>
# <button class="vote_button" data-url="/downvote" data-element-id="downvotes"> Down Vote</button>
