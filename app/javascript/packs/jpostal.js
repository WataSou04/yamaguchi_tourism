import "jquery-jpostal-ja"

function jpostal() {
  $('#zipcode').jpostal({   
    postcode : ['#zipcode'],
    address : {
      '#tourist_spot_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load", jpostal);