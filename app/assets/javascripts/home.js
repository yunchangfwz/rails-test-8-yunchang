var call_ajax_get_product= function (){
  var call = 0;
  $('input[name="band_ids[]"]').change(function(){
    if (call == 0) {
      call = 1;
      setTimeout(function(){
        get_data_fillter();
      }, 1000);
    }
  })

  function get_data_fillter(){
    var brand_ids = $('input[name="band_ids[]"]:checked').map(function(){
                      return $(this).val();
                    }).get();
    

    call = 0;
  }
}