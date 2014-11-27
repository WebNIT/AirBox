# Preventing from session hijacking
config.force_ssl = true

class Session < ActiveRecord::Base
  def self.sweep(time = 1.hour)
    if time.is_a?(String)
      time = time.split.inject { |count, unit| count.to_i.send(unit) }
    end
 
    delete_all "updated_at < '#{time.ago.to_s(:db)}'"
  end
end


# Preventing CSRF
<a href="" onclick="
  var f = document.createElement('form');
  f.style.display = 'none';
  this.parentNode.appendChild(f);
  f.method = 'POST';
  f.action = 'http://www.example.com/account/destroy';
  f.submit();
 return false;">


def handle_unverified_request
  super
  sign_out_user # Example method that will destroy the user cookies.
end

#SELECT * FROM Users WHERE name = '' OR 1 --'
#SELECT * FROM Users WHERE login = '' OR '1'='1' AND password = '' OR '2'>'1' LIMIT 1

# SQL injection
sanitize_sql()
Model.where("login = ? AND password = ?", entered_user_name, entered_password).first


Preventing AES 128
cipher = OpenSSL::Cipher.new 'AES-128-CBC'
pass_phrase = '$password'

key_secure = key.export cipher, pass_phrase

open 'private.secure.pem', 'w' do |io|
  io.write key_secure
end

# Clickjacking
# tells the browser that your application can only be framed by pages originating from the same domain.
X-Frame-Options: SAMEORIGIN

# Privileage Escalation
@user = @current_user.find(params[:id])

# CSS Injection
element.innerHTML = “<%=Encoder.encodeForJS(Encoder.encodeForHTML(untrustedData))%>”;
element.outerHTML = “<%=Encoder.encodeForJS(Encoder.encodeForHTML(untrustedData))%>”;


# Filtering malicious upload
# Make sure file uploads don't overwrite important files and process media files asynchronously. 
def sanitize_filename(filename) 
 returning filename.strip do |name| 
 # NOTE: File.basename doesn't work right with Windows paths on Unix 
 # get only the filename, not the whole path 
 name.gsub! /^.*(\\|\/)/, '' 
 # Finally, replace all non alphanumeric, underscore 
 # or periods with underscore 
 name.gsub! /[^\w\.\-]/, '_' 
 end 
end 


# Preventing Heartbleed
key2 = OpenSSL::PKey::RSA.new File.read 'private_key.pem'
key2.public? # => true

name = OpenSSL::X509::Name.parse 'CN=nobody/DC=example'

csr_cert = OpenSSL::X509::Certificate.new
csr_cert.serial = 0
csr_cert.version = 2
csr_cert.not_before = Time.now
csr_cert.not_after = Time.now + 600

csr_cert.subject = csr.subject
csr_cert.public_key = csr.public_key
csr_cert.issuer = ca_cert.subject

extension_factory = OpenSSL::X509::ExtensionFactory.new
extension_factory.subject_certificate = csr_cert
extension_factory.issuer_certificate = ca_cert

csr_cert.add_extension    extension_factory.create_extension('basicConstraints', 'CA:FALSE')

csr_cert.add_extension    extension_factory.create_extension(
    'keyUsage', 'keyEncipherment,dataEncipherment,digitalSignature')

csr_cert.add_extension    extension_factory.create_extension('subjectKeyIdentifier', 'hash')

csr_cert.sign ca_key, OpenSSL::Digest::SHA1.new

open 'csr_cert.pem', 'w' do |io|
  io.write csr_cert.to_pem
end


# Peer Verification
context.ca_file = 'ca_cert.pem'
context.verify_mode = OpenSSL::SSL::VERIFY_PEER

require 'socket'

tcp_client = TCPSocket.new 'localhost', 5000
ssl_client = OpenSSL::SSL::SSLSocket.new client_socket, context
ssl_client.connect

ssl_client.puts "hello server!"
puts ssl_client.gets