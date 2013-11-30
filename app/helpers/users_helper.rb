module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50, circle: false })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    circle = options[:circle]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if circle
    	image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle")
    else
    	image_tag(gravatar_url, alt: user.name, class: "gravatar img-rounded")
    end
  end
end
