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

## Filtering Search Results

** 1. main_controller.rb **
```ruby
def show
  if params[:space_area_id] != ""
    @spaces = Space.where(country_id: params[:space_country_id], area_id: params[:space_area_id]).order("RANDOM()")
  else
    flash[:danger] = "Please select country."
    redirect_to root_path
  end
end
```

**2.show.html.erb**
> We will only touch on populating the extra filter option. If @spaces is not empty:

```erb

<div class="center-content text-white-opacity">
  <h2>Search results</h2>
      Filter by:

      <%= select_tag :space_type_id, options_for_select(SpaceType.all.order('id ASC').collect {|x| [x.name, x.id]}.insert(0, "Space Type")),class: 'filter_options styled-dropdown' %>
      <%= select_tag :vibe_id, options_for_select(Vibe.all.order('id ASC').collect {|x| [x.name, x.id]}.insert(0, "Vibe")), class: 'filter_options styled-dropdown'%>

      <div>
          Amenities:
          <% Amenity.all.order('id ASC').collect.each do |amenity| %>
          <label class="checkboxSpacer">
            <%= check_box_tag "amenity_id[#{amenity.id}]", amenity.id, false, class: 'amenities_checkbox filter_options' %>
            <%= amenity.name %>
          </label>s
          <% end %>
      </div>

      <div class="make-div-inline-block">
          Start <%= date_field_tag :start_date, "", class: 'filter_options input-styled', id: 'start_date'%>
      </div>

      <div style="display:inline-block">
        End <%= date_field_tag :start_date,"", class: 'filter_options input-styled', id: 'end_date'%>
      </div>
</div>
```
