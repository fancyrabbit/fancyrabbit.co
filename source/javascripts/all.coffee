#= require_tree ./vendor
#= require_tree .

$ ->
  $('#tagline').fitText(1.561)

  $('.client').on 'click', (e)->
    $client = $(@)
    $target = $(e.target)

    # website handling
    return if $client.hasClass('active') && ($target.is('a') || $target.parent().is('a'))
    e.preventDefault()
    e.stopPropagation()

    $activeClient = $client.parent('.client-wrapper').siblings().find('.client.active')
    
    if $activeClient.length
      $activeClient.one 'transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', ->
        $client.addClass('active')
      $activeClient.removeClass('active')
    else
      $client.toggleClass('active')

      $('body').one 'click', (e) ->
        $('.client').removeClass('active')

  $('nav a[href^="#"]').on 'click', (e)->
      e.preventDefault()
      $('html, body').animate
        scrollTop: $($(this).attr('href')).offset().top
      , 500