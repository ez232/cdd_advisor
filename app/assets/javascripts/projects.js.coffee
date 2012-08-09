# Place all the behaviors and hooks related to the matching controller here. All
# this logic will automatically be available in application.js. You can use
# CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#project_maximum_target').click ->
      text = $(this).parent().parent().find('#project_target_market')
      text.attr('disabled', $(this).is(':checked'))
      text.val(null) if $(this).is(':checked')

$ ->
  cb = $(this).find('#project_maximum_target')
  text = $(this).find('#project_target_market')
  text.attr('disabled', cb.is(':checked'))