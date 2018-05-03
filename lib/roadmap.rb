module Roadmap
  # Retrieves roadmap data for current users
  # Params: chain_id = integer | chain_id can be retrived by running the get_me method on the current user. It is found listed under current_enrollement/chain_id
  def get_roadmap(chain_id)
    # Point the HTTParty GET method at the roadmaps/#{chain_id} endpoint of Bloc's API.
    # Use HTTParty's header option to pass the auth_token.
    response = self.class.get(api_url("roadmaps/#{chain_id}"), headers: { "authorization" => @auth_token })
    # Parse the JSON document returned in the response into a Ruby hash.
    JSON.parse(response.body)
  end

  # Retrieves individual checkpoint data
  # Params: checkpoint_id = integer | checkpoint_id can be retrived by running the get_roadmap method on the current user. It is found listed under sections/checkpoint/id.
  def get_checkpoint(checkpoint_id)
    # Point the HTTParty GET method at the checkpoints/#{checkpoint_id} endpoint of Bloc's API.
    # Use HTTParty's header option to pass the auth_token.
    response = self.class.get(api_url("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
    # Parse the JSON document returned in the response into a Ruby hash.
    JSON.parse(response.body)
  end

  # Retrieves the remaining checkpoints for the current user
  # Params: chain_id = integer | chain_id can be retrived by running the get_me method on the current user. It is found listed under current_enrollement/chain_id
  def get_remaining_checkpoints(chain_id)
    # Point the HTTParty GET method at the enrollment_chains/#{chain_id}/checkpoints_remaining_in_section endpoint of Bloc's API.
    # Use HTTParty's header option to pass the auth_token.
    response = self.class.get(api_url("enrollment_chains/#{chain_id}/checkpoints_remaining_in_section"), headers: { "authorization" => @auth_token })
    # Parse the JSON document returned in the response into a Ruby hash.
    JSON.parse(response.body)
  end
end
