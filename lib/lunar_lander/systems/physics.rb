class Physics < System
  # This constant could conceivably live in the gravity component...
  ACCELERATION = 0.005 # m/s^2
  DOWN = Math.cos(Math::PI)

  def process_one_game_tick(container, delta, entity_mgr)
    gravity_entities = entity_mgr.get_all_entities_possessing_component(GravitySensitive)

    gravity_entities.each do |e|
      spatial_component = entity_mgr.get_component(e, SpatialState)

      # move horizontally according to dx
      amount = 0.01 * delta * spatial_component.dx
      spatial_component.x += (amount)

      # vertical speed will feel gravity's effect
      spatial_component.dy += ACCELERATION * delta

      # now fall according to dy
      amount = -0.01 * delta * spatial_component.dy
      spatial_component.y += (amount * DOWN)
    end
  end
end
