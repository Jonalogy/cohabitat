$(document).on('turbolinks:load', function() {

  console.log("DOM content loaded and ready to roll!");
  console.log("bookings.js loaded");

  total()

  $('#booking_seat').change(function(){
      total()
    })//end of event listener
  $('#booking_start_1i').change(function(){
      total()
    })//end of event listener
  $('#booking_start_2i').change(function(){
      total()
    })//end of event listener
  $('#booking_start_3i').change(function(){
      total()
    })//end of event listener
  $('#booking_end_1i').change(function(){
      total()
    })//end of event listener

  $('#booking_end_2i').change(function(){
      total()
    })//end of event listener

  $('#booking_end_3i').change(function(){
      total()
    })//end of event listener

}) //end of DOM-Content-Loaded

function total(){
      var seat_price = $('#seat_price').val();

      var starting = $('#booking_start_1i').val() + "-" + $('#booking_start_2i').val() + "-" + $('#booking_start_3i').val();
      starting = Date.parse(starting)

      var ending = $('#booking_end_1i').val() + "-" + $('#booking_end_2i').val() + "-" + $('#booking_end_3i').val();
      ending = Date.parse(ending)

      var days = ((ending - starting)/86400000)+1

      var total = $('#booking_seat').val() * seat_price * days;

      if (total > 0) {
        $('.stripe-button-el').show()
        total = '$' + total.toFixed(2)
        $('#booking_total_price').val(total);
        $('#show_price').text(total);
      } else {
        total = "Impossible! End date cannot be earlier than start date!"
        $('#show_price').text(total);
        $('.stripe-button-el').hide()
      }

  }
