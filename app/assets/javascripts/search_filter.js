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

    if (($("#start_date").val() != "") && ($("#end_date").val() != "")){
      filter_options["start_date"] = $("#start_date").val()
      filter_options["end_date"] = $("#end_date").val()
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

          if (data.length > 0){
            for (var i = 0 ; i < data.length ; i++) {
              $('.AJAXthis').append("<div class='col-xs-12 col-sm-6 col-md-4'><img class='search-space-image' src='"+ data[i]["images"][0]["url"] +"' alt='space image' /><p><a href='/spaces/" + data[0].id + "'>" + data[0].space_name + "</a></p><p>" + data[0].space_type.name + ", " + data[0].vibe.name + "</p></div>")
            }
          }
          else {
            $('.AJAXthis').append("<div class=''><p>No listings found. Try other combinations.</p></div>")
          }




          }).fail(function () {
            console.log("ajax failed")
          })



  })

});
