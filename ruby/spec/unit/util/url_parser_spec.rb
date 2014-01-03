require 'util/url_parser'

require 'net/http'

include Util
describe UrlParser do
  describe 'URL Parser calculate urls' do
    it 'should handle base url' do
      url = UrlParser.parse('http://www.espn.com')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == ''
      
    end
    it 'should handle base url with trailing slash' do
      url = UrlParser.parse('http://www.espn.com/')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/'
      
    end
    it 'should handle base url with trailing slash in path' do
      url = UrlParser.parse('http://www.espn.com/sports/')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/sports/'
      
    end
    it 'should handle base url with wrong port' do
      url = UrlParser.parse('https://www.espn.com:80')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'https'
      url.path.should == ''
      
    end
    it 'should handle base no protocol' do
      url = UrlParser.parse('www.espn.com')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == ''
      
    end
    it 'should capture path' do
      url = UrlParser.parse('www.espn.com/sports')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/sports'
      
    end
    it 'should capture multi-part path' do
      url = UrlParser.parse('www.espn.com/sports/basketball')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/sports/basketball'
      
    end
    it 'should capture multi-part path with trailing slash' do
      url = UrlParser.parse('www.espn.com/sports/basketball/')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.protocol.should == 'http'
      url.path.should == '/sports/basketball/'
      
    end
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

  describe 'Ruby URL calculate urls' do
    it 'should handle base url' do
      url = URI.parse('http://www.espn.com')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.path.should == ''
      
    end
    it 'should handle base url with slash' do
      url = URI.parse('http://www.espn.com/')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.path.should == '/'
      
    end
    it 'should handle path' do
      url = URI.parse('http://www.espn.com/sports')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.path.should == '/sports'
      
    end
    it 'should handle path with trailing slash' do
      url = URI.parse('http://www.espn.com/sports/')
      
      url.port.should == 80
      url.host.should == 'www.espn.com'
      url.path.should == '/sports/'
      
    end
  end

end
