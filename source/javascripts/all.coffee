#= require_tree ./vendor
#= require_tree .

$ ->
  $('#tagline').fitText(1.561)

  $('.client').on 'click', (e)->
    $client = $(@)
    
    # website handling
    return if $client.hasClass('active') && $(e.target).is('a')
    e.preventDefault()

    $activeClient = $client.parent('.client-wrapper').siblings().find('.client.active')
    
    if $activeClient.length
      $activeClient.one 'transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', ->
        $client.addClass('active')
      $activeClient.removeClass('active')
    else
      $client.toggleClass('active')

  $('nav a[href^="#"]').on 'click', (e)->
      e.preventDefault()
      $('html, body').animate
        scrollTop: $($(this).attr('href')).offset().top
      , 500