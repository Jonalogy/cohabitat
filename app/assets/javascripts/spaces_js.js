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

        if (i == 0) {
          $('#space_area_id').append("<option selected value="+data[i].id+">"+data[i].name+"</option>")
        }
        else {
          $('#space_area_id').append("<option value="+data[i].id+">"+data[i].name+"</option>")
        }

      }

      }).fail(function () {
        console.log("failed")
      })

  })

});
