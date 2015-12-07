$(document).on "click", ".read-more", (e) ->
  e.preventDefault()

  selector = $(this).attr("href")
  $(selector).removeClass("hidden")
  $(this).remove()

  return false
