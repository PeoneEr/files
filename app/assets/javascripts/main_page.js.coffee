$ ->
  $('.js-child-item').change ->
    $.ajax
      url: '/'
      type: 'post'
      data: {
        id: $(this).val()
      }

    true

  $('.js-toggle-dir').click ->
    $(this).parent().next('.titles').toggle()

    false
