require 'util/url_parser'

require 'net/http'

include Util
describe UrlParser do
  def validate_url(url, expectation)
    url.port.should == expectation[:port]
    url.host.should == expectation[:host]
    url.path.should == expectation[:path]
    url.scheme.should == expectation[:protocol]
    if expectation[:query_string]
      url.query.should == expectation[:query_string]
    end
  end
  
  describe 'base http urls' do
    before (:all) do
      @url_string = 'http://www.espn.com'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end
  
  describe 'base http urls with trailing slash' do
    before (:all) do
      @url_string = 'http://www.espn.com/'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end
  
  describe 'http url with trailing slash in path' do
    before (:all) do
      @url_string = 'http://www.espn.com/sports/'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/sports/', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end
  
  describe 'https url with explicit port' do
    before (:all) do
      @url_string = 'https://www.espn.com:442/sports'
      @expectation = {:port => 442, :host => 'www.espn.com', :path => '/sports', :protocol => 'https'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end

  describe 'url with no protocol' do
    before (:all) do
      @url_string = 'www.espn.com'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      # URI does not parse this the way I think it should
      uri_expectation = {:port => nil, :protocol => nil, :host => nil, :path => 'www.espn.com'}
      validate_url(URI.parse(@url_string), uri_expectation)
    end
  end
  
  describe 'url with path' do
    before (:all) do
      @url_string = 'http://www.espn.com/sports/basketball/'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/sports/basketball/', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end

  describe 'url with hostname with dash' do
    before (:all) do
      @url_string = 'http://www.es-pn.com/sports/basketball/'
      @expectation = {:port => 80, :host => 'www.es-pn.com', :path => '/sports/basketball/', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end
  
  describe 'url with IP Address' do
    before (:all) do
      @url_string = 'http://10.1.2.3/sports/basketball/'
      @expectation = {:port => 80, :host => '10.1.2.3', :path => '/sports/basketball/', :protocol => 'http'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end

  describe 'file protocol' do
    before (:all) do
      @url_string = 'file://Users/pchristmann/.bash_profile'
      @expectation = {:port => nil, :host => 'Users', :path => '/pchristmann/.bash_profile', :protocol => 'file'}
    end
    it 'should be parsed by URL Parser' do
      validate_url(UrlParser.parse(@url_string), @expectation)
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), @expectation)
    end
  end
  
  describe 'query parameters' do
    before (:all) do
      @url_string = 'http://www.espn.com/sports?type=basketball'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/sports', :protocol => 'http', :query_string => 'type=basketball'}
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, @expectation)
      url.query_params.length.should == 1
      url.query_params['type'].should == 'basketball'
      
    end
    it 'should be parsed by Ruby URL' do
      url = URI.parse(@url_string)
      validate_url(url, @expectation)
    end
  end

  describe 'query parameters without path' do
    before (:all) do
      @url_string = 'http://www.espn.com?type=basketball'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '', :protocol => 'http', :query_string => 'type=basketball'}
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, @expectation)
      url.query_params.length.should == 1
      url.query_params['type'].should == 'basketball'
      
    end
    it 'should be parsed by Ruby URL' do
      url = URI.parse(@url_string)
      validate_url(url, @expectation)
    end
  end

  describe 'query parameters with slash-only path path' do
    before (:all) do
      @url_string = 'http://www.espn.com/?type=basketball'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/', :protocol => 'http', :query_string => 'type=basketball'}
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, @expectation)
      url.query_params.length.should == 1
      url.query_params['type'].should == 'basketball'
      
    end
    it 'should be parsed by Ruby URL' do
      url = URI.parse(@url_string)
      validate_url(url, @expectation)
    end
  end
  
  describe 'multiple query parameters' do
    before (:all) do
      @url_string = 'http://www.espn.com/?type=basketball&path=sports'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/', :protocol => 'http', :query_string => 'type=basketball&path=sports'}
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, @expectation)
      url.query_params.length.should == 2
      url.query_params['type'].should == 'basketball'
      url.query_params['path'].should == 'sports'
      
    end
    it 'should be parsed by Ruby URL' do
      url = URI.parse(@url_string)
      validate_url(url, @expectation)
    end
  end

  describe 'repeated query parameters' do
    before (:all) do
      @url_string = 'http://www.espn.com/?type=basketball&path=sports&path=foo'
      @expectation = {:port => 80, :host => 'www.espn.com', :path => '/', :protocol => 'http', :query_string => 'type=basketball&path=sports&path=foo'}
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, @expectation)
      url.query_params.length.should == 2
      url.query_params['type'].should == 'basketball'
      url.query_params['path'].should == 'foo'
      
    end
    it 'should be parsed by Ruby URL' do
      url = URI.parse(@url_string)
      validate_url(url, @expectation)
    end
  end
end
