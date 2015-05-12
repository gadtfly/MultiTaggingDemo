// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  // https://jqueryui.com/autocomplete/#multiple-remote
  $('[data-autocomplete-source]').autocomplete({
    minLength: 0,
    source: function(request, response){
      var source = $(this.element).data('autocomplete-source')
      var field = $(this.element).data('autocomplete-field')
      var term = request.term.split(/,\s*/).pop()
      $.get(source, {term: term}, function(data){
        response(data.map(function(element){ return element[field] }))
      })
    },
    focus: function() {
      return false;
    },
    select: function(event, ui) {
      var terms = this.value.split(/,\s*/)
      terms.pop()
      terms.push(ui.item.value)
      terms.push("");
      this.value = terms.join( ", " );
      return false;
    }
  })
})
