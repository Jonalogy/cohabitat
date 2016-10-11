$(document).on('turbolinks:load', function() {

  console.log("DOM content loaded and ready to roll!");
  console.log("bookings.js loaded");

  var seat_price = $('#seat_price').val();

  $('#booking_seat').on('blur',function(){
      var total = $('#booking_seat').val() * seat_price
      $('#booking_total_price').val(total)
      $('#show_price').text(total)
    })//end of event listener

}) //end of DOM-Content-Loaded
