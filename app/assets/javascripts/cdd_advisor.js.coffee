jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $(".mod-tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $('.save-modal').click(->
    $(this).button('loading')
  )