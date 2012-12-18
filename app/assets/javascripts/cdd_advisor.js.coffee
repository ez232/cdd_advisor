jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $(".mod-tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $('.save-modal').click(
    -> $(this).button('loading')
  )

  bodyStyle = $('body')[0].style
  $('.cp').colorpicker().on('changeColor',
    (ev) ->
      rgb = ev.color.toRGB()
      $(this).attr('value', 'rgb(' + rgb.r + ',' + rgb.g + ',' + rgb.b + ')')
      $(this).next('.add-on').find('i').css("background-color", ev.color.toHex())
  )