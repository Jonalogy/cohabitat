$(document).on('turbolinks:load', function() {
  console.log("search_filter.js loaded");

  $('.filter_options').change(function (event) {

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

    if (($("#start_date__1i").val() != "") && ($("#end_date__1i").val() != "")){

      if (($("#start_date__2i").val() != "") && ($("#end_date__2i").val() != "")){

        if (($("#start_date__3i").val() != "") && ($("#end_date__3i").val() != "")){
          filter_options["start_date"] = $("#start_date__1i").val() + "-" + $("#start_date__2i").val() + '-' + $("#start_date__3i").val()
          filter_options["end_date"] = $("#end_date__1i").val() + "-" + $("#end_date__2i").val() + '-' + $("#end_date__3i").val()
        }
      }
    }

    // console.log("filter_options: "+ JSON.stringify(filter_options))

        $.ajax({
          url: '/searchfilter',
          type: 'GET',
          data: filter_options,
          dataType: 'json'
        }).done(function (data) {

          console.log("Search Results => ", data)
          $('.AJAXthis').empty()

          if (data.length > 0){
            for (var i = 0 ; i < data.length ; i++) {
              $('.AJAXthis').append("<div class='col-xs-12 col-sm-6 col-md-4 display-space-box'><img class='search-space-image' src='"+ data[i]["images"][0]["url"] +"' alt='space image' /><p><a href='/spaces/" + data[i].id + "'>" + data[i].space_name + "</a></p><p>" + data[i].space_type.name + ", " + data[i].vibe.name + "</p></div>")
            }
          }
          else {
            $('.background-image-search-results').addClass('background-image-search-results-2')
            $('.background-image-search-results-2').addClass('background-image-search-results')
            $('.AJAXthis').append("<div class='center-content add-padding'><p>No listings found. Try other combinations.</p></div>")
          }

          }).fail(function () {
            console.log("ajax failed")
          })

  })

});
