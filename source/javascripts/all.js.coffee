#= require "bootstrap"
#= require 'handlebars'
#= require 'moment.2.9.0.min'
#= require 'modernizr.2.8.3'
#= require_tree .

if (!Modernizr.svg)
  $("#rubyloco-logo").attr("src", "https://secure.gravatar.com/avatar/39ea1010c60a77fc681b38fdbee13556?s=420");

$ ->
  $("body").tooltip(selector: "[data-toggle=tooltip]")
