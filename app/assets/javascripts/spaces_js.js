$(document).on('turbolinks:load', function() {

  console.log("turbolinks loaded");
  console.log("spaces.js loaded");

  $('#space_country_id').change(function (event) {

    $.ajax({
      url: '/areaofcountry',
      type: 'GET',
      data: {country_id: this.value},
      dataType: 'json'
    }).done(function (data) {
      $('#space_area_id').empty()

      for (var i = 0; i< data.length ; i++){
        $('#space_area_id').append("<option value="+data[i].id+">"+data[i].name+"</option>")
      }

      // $('#' + data).empty()
      // message to be appended if friend request list is empty after ajax
      }).fail(function () {
        console.log("failed")
      })

    //
    // $.ajax({
    //   url: '/areas',
    //   type: 'PUT',
    //   data: {country_selected: this.value},
    //   dataType: 'json'
    // }).done(function (data) {
    //   $('#' + data).empty()
    //   // message to be appended if friend request list is empty after ajax
    //   }).fail(function () {
    //
    //   })

  })

});
