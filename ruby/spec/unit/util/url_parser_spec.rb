require 'util/url_parser'

require 'net/http'

include Util
describe UrlParser do
  def validate_url(url, expectation)
    url.port.should == expectation[:port]
    url.host.should == expectation[:host]
    url.path.should == expectation[:path]
    url.scheme.should == expectation[:protocol]
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

  describe 'URL Parser calculate urls' do
    it 'should capture query params' do
      url = UrlParser.parse('www.espn.com/sports?type=basketball')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/sports'
      url.query_string.should == '?type=basketball'
      url.query.length.should == 1
      url.query['type'].should == 'basketball'
      
    end
    it 'should capture query params without path' do
      url = UrlParser.parse('www.espn.com?type=basketball&path=sports')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == ''
      url.query.length.should == 2
      url.query['type'].should == 'basketball'
      url.query['path'].should == 'sports'
      
    end
    it 'should capture query params with path only' do
      url = UrlParser.parse('www.espn.com/?type=basketball&path=sports')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/'
      url.query.length.should == 2
      url.query['type'].should == 'basketball'
      url.query['path'].should == 'sports'
      
    end  
    it 'should capture full url' do
      url = UrlParser.parse('http://www.espn.com:442/sports/?type=basketball&path=sports&path=foo')
      
      url.port.should == 442
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/sports/'
      url.query.length.should == 2
      url.query['type'].should == 'basketball'
      url.query['path'].should == 'foo'
      
    end  
  end

end
