require "valorebooks/version"
require "valorebooks/xml_node"

module Valorebooks
  class ProductAPI
    API_URL = "http://prices.valorebooks.com/lookup-multiple-categories"

    def get_products(opts = {})
      puts opts.merge!({SiteID: opts[:SiteID] || ENV["VALOREBOOKS_SITE_ID"]})
      puts query_params = opts.map{ |k,v| "#{k}=#{v}"}
      url = "#{API_URL}?#{query_params.join("&")}"

      response = RestClient.get(url)
      Response.new(response)
    end
  end


  class Response
    def initialize(body)
      @body = body
    end

    def xml
      @xml ||= MultiXml.parse(@body)
    end
    alias_method :parse, :xml

    def success?
      xml["error"].nil?
    end
    alias_method :valid?, :success?

    def to_object
      @as_object ||= hash_to_ostruct(xml) 
    end

    def to_s
      @body 
    end
    alias_method :body, :to_s

    private
    def hash_to_ostruct(object)
      return case object
      when Hash
        result = {}
        object = object.dup
        object.each do |key, value|
          result[key.downcase] = hash_to_ostruct(value)
        end
        OpenStruct.new(result)
      when Array
        object = object.dup
        object.map! { |i| hash_to_ostruct(i) }
      else
        object
      end
    end
  end
end
