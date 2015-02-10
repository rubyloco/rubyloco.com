#= require "bootstrap"
#= require 'handlebars'
#= require 'moment.2.9.0.min'
#= require_tree .

$ ->
  $("body").tooltip(selector: "[data-toggle=tooltip]")
