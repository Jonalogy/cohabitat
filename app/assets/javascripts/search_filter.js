$(document).on('turbolinks:load', function() {
  console.log("search_filter.js loaded");

  $('.filter_options').change(function (event) {
    console.log("toggling")


    var filter_options = new Object()
    filter_options["country_id"] = $('#country_id').val()
    filter_options["area_id"] = $('#area_id').val()

    if ($('#space_type_id').val() !== "Space Type"){
      filter_options["space_type_id"] = $('#space_type_id').val()
    }
    if ($('#vibe_id').val() !== "Vibe") {
      filter_options["vibe_id"] = $('#vibe_id').val()
    }
    if ($("input:checked").length != 0){
      filter_options["amenities_ids"] = []
      for(var i = 0 ; i < $("input:checked").length ; i++){
        filter_options["amenities_ids"].push($("input:checked")[i].value)
      }
    }

    console.log("filter_options: "+ JSON.stringify(filter_options))

        $.ajax({
          url: '/searchfilter',
          type: 'GET',
          data: filter_options,
          dataType: 'json'
        }).done(function (data) {
          console.log("AJAX RETURNED DATA>>>>> "+data)
          $('.AJAXthis').empty()
          $('.AJAXthis').append(JSON.stringify(data))
          // $('#space_area_id').empty()
          }).fail(function () {
            console.log("ajax failed")
          })



  })

});
