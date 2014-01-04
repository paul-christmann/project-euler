module Util
  class UrlParser

    URL_REGEX = /([a-z]+:)?(\/\/)?([^?\/\:]+)(\:[\d]+)?(\/[^?]*)?([\?].*)?/i
    def self.parse(input)
      parsed = input.scan(URL_REGEX)
      raise "Unexpected URL Input: #{input}" unless parsed.length == 1 
      parts = parsed[0]
      raise "Unexpected URL Input: #{input} (#{parts})" unless parts.length == 6
      
      arg_hash = {}
      arg_hash[:host] = parts[2]

      arg_hash[:protocol]     = ( parts[0] ? parts[0].gsub(/:/,'').downcase : 'http')
      arg_hash[:port]         = ( parts[3] ? parts[3].gsub(/:/,'').to_i : UrlParser.port_for(arg_hash[:protocol]) )
      arg_hash[:path]         = ( parts[4] ? parts[4].downcase : '' )
      arg_hash[:query_string] = ( parts[5] ? parts[5].downcase : '').gsub(/^\?/,'')
      
      MyUrl.new(arg_hash)
    end
  end
  
  def UrlParser.port_for(protocol)
    case protocol
      when 'ftp' then 21
      when 'ssh' then 22
      when 'http' then 80
      when 'https' then 443
      else nil
    end
  end
  
  class MyUrl
    attr_accessor :protocol, :host, :port, :path, :query_string
    def initialize(params)
      params.each do |k,v|
        begin
          self.send("#{k}=", v)
        rescue
        end
      end
    end
    # For compatibility with Ruby URI class
    def scheme
      self.protocol
    end
    # For compatibility with Ruby URI class, query should return the query_string
    def query
      self.query_string
    end
    def query_params
      params = {}
      self.query_string.gsub(/\?/,'').split('&').each do |param|
        k,v = param.split('=')
        params[k] = v
      end
      params
    end
  end
end
