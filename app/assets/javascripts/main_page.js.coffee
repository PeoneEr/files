$ ->
  $('.js-child-item').change ->
    if $(this).is(':checked')
      watched = true
    else
      false

    $.ajax
      url: '/'
      type: 'post'
      data: {
        id: $(this).val()
        watched: watched
      }

    true
