require 'util/url_parser'

require 'net/http'

include Util
describe UrlParser do
  def validate_url(url, port, host, path)
    url.port.should == port
    url.host.should == host
    url.path.should == path
  end
  
  describe 'base http urls' do
    before (:all) do
      @url_string = 'http://www.espn.com'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, 'www.espn.com', '')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), 80, 'www.espn.com', '')
    end
  end
  
  describe 'base http urls with trailing slash' do
    before (:all) do
      @url_string = 'http://www.espn.com/'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, 'www.espn.com', '/')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), 80, 'www.espn.com', '/')
    end
  end
  
  describe 'http url with trailing slash in path' do
    before (:all) do
      @url_string = 'http://www.espn.com/sports/'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, 'www.espn.com', '/sports/')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), 80, 'www.espn.com', '/sports/')
    end
  end
  
  describe 'https url with explicit port' do
    before (:all) do
      @url_string = 'https://www.espn.com:442/sports/'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 442, 'www.espn.com', '/sports/')
      url.protocol.should == 'https'
    end
    it 'should be parsed by Ruby URL' do
      validate_url(URI.parse(@url_string), 442, 'www.espn.com', '/sports/')
    end
  end

  describe 'url with no protocol' do
    before (:all) do
      @url_string = 'www.espn.com'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, 'www.espn.com', '')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      # URI does not parse this.
      validate_url(URI.parse(@url_string), nil, nil, 'www.espn.com')
    end
  end
  
  describe 'url with path' do
    before (:all) do
      @url_string = 'http://www.espn.com/sports/basketball/'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, 'www.espn.com', '/sports/basketball/')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      # URI does not parse this.
      validate_url(URI.parse(@url_string), 80, 'www.espn.com', '/sports/basketball/')
    end
  end

  describe 'url with hostname with dash' do
    before (:all) do
      @url_string = 'http://www.es-pn.com/sports/basketball/'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, 'www.es-pn.com', '/sports/basketball/')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      # URI does not parse this.
      validate_url(URI.parse(@url_string), 80, 'www.es-pn.com', '/sports/basketball/')
    end
  end
  
  describe 'url with IP Address' do
    before (:all) do
      @url_string = 'http://10.1.2.3/sports/basketball/'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 80, '10.1.2.3', '/sports/basketball/')
      url.protocol.should == 'http'
    end
    it 'should be parsed by Ruby URL' do
      # URI does not parse this.
      validate_url(URI.parse(@url_string), 80, '10.1.2.3', '/sports/basketball/')
    end
  end

  describe 'file protocol' do
    before (:all) do
      @url_string = 'file://Users/pchristmann/.bash_profile'
    end
    it 'should be parsed by URL Parser' do
      url = UrlParser.parse(@url_string)
      validate_url(url, 0, 'Users', '/pchristmann/.bash_profile')
      url.protocol.should == 'file'
    end
    it 'should be parsed by Ruby URL' do
      # URI does not parse this.
      validate_url(URI.parse(@url_string), nil, 'Users', '/pchristmann/.bash_profile')
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
