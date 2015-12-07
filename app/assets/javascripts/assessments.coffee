$(document).on "click", "body.assessments .personality-type", (e) ->
  e.preventDefault()

  $this = $(this)
  active = $this.hasClass("active")

  $(".personality-type").removeClass("active")
  $(".pt-description").addClass("hidden")

  unless active
    $this.addClass("active")
    $(".pt-description" + $this.data("ref")).removeClass("hidden")

  return false
