$ ->
  $('.js-child-item').change ->
    $.ajax
      url: '/'
      type: 'post'
      data: {
        id: $(this).val()
      }
