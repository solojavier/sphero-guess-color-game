require './app'
require './sphero'
require 'webrick'
require 'webrick/https'
require 'openssl'

CERT_PATH       = './ssl/'
webrick_options = {
  :Port               => 8443,
  :Logger             => WEBrick::Log::new($stderr, WEBrick::Log::DEBUG),
  :DocumentRoot       => "/ruby/htdocs",
  :SSLEnable          => true,
  :SSLVerifyClient    => OpenSSL::SSL::VERIFY_NONE,
  :SSLCertificate     => OpenSSL::X509::Certificate.new(  File.open(File.join(CERT_PATH, "server.crt")).read ),
  :SSLPrivateKey      => OpenSSL::PKey::RSA.new(          File.open(File.join(CERT_PATH, "server.key")).read ),
  :SSLCertName        => [ [ "CN",WEBrick::Utils::getservername  ]  ]
}

fork { SpheroRobot.work! }
sleep 5 #While sphero initializes

GAME = Game.new
Rack::Handler::WEBrick.run MyApp, webrick_options
