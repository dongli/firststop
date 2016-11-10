$(document).on('turbolinks:load', function() {
  $('.markdown-content').each(function() {
    var md = new Remarkable()
    $(this).html(md.render($(this).html()))
  })
})
