#= require_tree ./vendor
#= require_tree .

showClient = ($client) ->
  $client.addClass('active')

hideClient = ($client) ->
  $client.addClass('deactivating').removeClass('active')

  setTimeout ->
    $client.removeClass('deactivating')
  , 500

$ ->
  $('#tagline').fitText(1.561)

  $('.client').on 'click', (e) ->
    $client = $(@)
    $target = $(e.target)

    # website handling
    return if $client.hasClass('active') && ($target.is('a') || $target.parent().is('a'))
    e.preventDefault()
    e.stopPropagation()

    $activeClient = $client.parent('.client-wrapper').siblings().find('.client.active')
    
    if $activeClient.length > 0
      $activeClient.one 'transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd', ->
        showClient($client)
      hideClient($activeClient)
    else if $client.hasClass('active')
      hideClient($client)
    else
      showClient($client)

  $('body').click (e) ->
    $client = $('.client.active')
    hideClient($client) if $client.length > 0

  $('nav a[href^="#"]').on 'click', (e)->
      e.preventDefault()
      $('html, body').animate
        scrollTop: $($(this).attr('href')).offset().top
      , 500