#= require "bootstrap"
#= require 'handlebars'
#= require 'moment.2.0.0.min'
#= require_tree .

$ ->
  $("body").tooltip(selector: "[data-toggle=tooltip]")
