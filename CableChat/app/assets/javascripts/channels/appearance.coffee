
App.cable.subscriptions.create "AppearanceChannel",
  # Called when the subscription is ready for use on the server.
  connected: ->
    # # @install()
    @appear()

  # Called when the WebSocket connection is closed.
  disconnected: ->
    # # @uninstall()
    @disappear()

  # Called when the subscription is rejected by the server.
  rejected: ->
    # @uninstall()

  appear: ->
    # Calls `AppearanceChannel#appear(data)` on the server.
    #  I think this is what is failing
    @perform("appear")
    # @perform("appear")

    disappear: ->
      # Calls `AppearanceChannel#appear(data)` on the server.
      #  I think this is what is failing
      @perform("disappear")
      # @perform("appear")

  away: ->
    # Calls `AppearanceChannel#away` on the server.
    @perform("disappear")

  #
  # buttonSelector = "[data-behavior~=appear_away]"
  #
  # install: ->
  #   $(document).on "turbolinks:load.appearance", =>
  #     @appear()
  #
  #   $(document).on "click.appearance", buttonSelector, =>
  #     @away()
  #     false
  #
  #   $(buttonSelector).show()
  #
  # uninstall: ->
  #   $(document).off(".appearance")
  #   $(buttonSelector).hide()
