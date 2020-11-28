// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("jquery")
import "bootswatch/dist/cerulean/bootstrap.min.css";


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(function(){
  $("#complex").hide();
  $("#commercial").hide();
});

$(document).on("change", "#building_subtype", function(){

    var value = $(this).val();
    if (value === "house"){
      $("#house").show();
      $("#complex").hide();
      $("#commercial").hide();
    }else if (value === "complex"){
      $("#house").hide();
      $("#complex").show();
      $("#commercial").hide();
    }else if(value === "commercial"){
      $("#house").hide();
      $("#complex").hide();
      $("#commercial").show();
    }
  })
