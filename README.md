# Co-Habitat readme

> ER diagram: https://drive.google.com/file/d/0B3EKE_Nx4TenYmM1aG52SnU3VE0/view?usp=sharing

## Populating Country's select_tag
**1. From index.html.erb**
Query is done to populate all countries

```erb
<%= form_tag(search_path, :method => "get", id: "search-form") do %>
    <%= select_tag :space_country_id, options_for_select(Country.all.order('id ASC').collect {|x| [x.name, x.id]}.insert(0, "Select a country")), class: "styled-dropdown"%>

    <select name="space_area_id" id="space_area_id" class="styled-dropdown"><option value="">Select an area</option></select>

    <%= submit_tag "Search", class: "btn btn-secondary" %>
<% end %>
```

## Search Filter

Search button: ```.on('click',callback)```

**1. spaces_js.js**

jQuery ajax sends *data: {country_id: this.value}* to *area_controller*

```javascript
$.ajax({
      url: '/areaofcountry',
      type: 'GET',
      data: {country_id: this.value},
      dataType: 'json'
    }).done(function (data) {
      /* Continued in section 4 below*/
}) //END $('#space_country_id').change
```

**2. routes.rb**
```javascript
    get "areaofcountry" => "areas#area_of_country"
```
**3. area_controller.rb**

    def area_of_country
      @areas = Area.where(country_id: params[:country_id]).order('name ASC')
      render :json => @areas
    end

**4. spaces_js.js**

Populate data returned from area_controller using DOM manipulations

```javascript
  $ajax({
    /*Explained in section 1.*/
  }).done(
    $('#space_area_id').empty() //
      for (var i = 0; i< data.length ; i++) {
          if (i == 0) {
            $('#space_area_id').append("<option selected value="+data[i].id+">"+data[i].name+"</option>")
          } else {
            $('#space_area_id').append("<option value="+data[i].id+">"+data[i].name+"</option>")
          } // END if-else
      } //END of for (var i = 0; i< data.length ; i++)

      } /*END of .done()*/).fail(()=>{console.log("failed")})
  )
```
