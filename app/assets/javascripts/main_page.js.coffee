$ ->
  $('.js-child-item').change ->
    if $(this).is(':checked')
      watched = true
    else
      false

    $.ajax
      url: '/my/change_watched'
      type: 'post'
      data: {
        id: $(this).val()
        watched: watched
      }

    true

  $('.js-toggle-dir').click ->
    $(this).parent().next('.titles').slideToggle()

    false

  false
