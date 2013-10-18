require 'open-uri'

class WebAPI
  def initialize(url)
     @url=url
  end

  def build_url(operation_name, params)
    @url + operation_name + "?" + params.map { |param, value| "#{param}=#{value}" if value }.join("&")
  end


  class WebApiException < Exception
  end
end