var call_ajax_get_product= function (min_price_default, max_price_default, min, max){
  var call = 0;
  var price_slider = document.getElementById('price_slider');
  noUiSlider.create(price_slider, {
    start: [min_price_default, max_price_default],
    connect: true,
    step: 1,
    range: {
      'min': 0,
      'max': 200
    },
    format: wNumb({
      decimals: 0
    })
  });

  add_label_of_silder();

  price_slider.noUiSlider.on('update', function( values, handle ) {

    var value = values[handle];
    if ( handle ) {
      $('#search_filter_max_price').val(value)
    } else {
      $('#search_filter_min_price').val(value)
    }
    get_data()
  });


  $('input[name="search_filter[brand_ids][]"]').change(function(){
    get_data()
  })

  function add_label_of_silder(){
    var step = Math.floor((max - min) / 4);
    var html = "<div class='lable'><span>$"+ min + "</span>";
    vl = min;
    for (var i = 0; i < 3; i++) {
      vl = vl + step;
      html +="<span>$"+ vl +"</span>";
    }
    html += "<span>$"+ max +"</span></div>";

    $('#price_slider').prepend(html);
  }

  function get_data(){
    if (call == 0) {
      call = 1;
      setTimeout(function(){
        $('#new_search_filter').submit();
        $("#new_search_filter").on("ajax:success", function(e, data, status, xhr) {
          $('select').material_select();
          call = 0;
        }).on("ajax:error", function(e, xhr, status, error) {
          return $("#new_search_filter").append("<p>ERROR</p>");
          call = 0;
        });
      }, 1000);
    }
  }
}