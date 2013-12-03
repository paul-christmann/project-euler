require 'openssl'
require 'base64'
module ProjectEuler
  class Hashes
    HASH_FILE = File.join(File.dirname(__FILE__), 'hashes.csv')

    def initialize
    end
    
    def add_message(key, message)
      hashes = read_hashes
      if encrypted = hashes[key]
        puts "Key already exists: #{key}"
      else
        hashes[key], salt = encrypt(message)
        save_hashes(hashes)
        return salt
      end
    end

    def remove_message(key)
      hashes = read_hashes
      if encrypted = hashes[key]
        if hashes.delete(key)
          save_hashes(hashes)
        end
      else 
        puts "No such key: #{key}"
      end
    end
    
    def get_message(key, salt)
      hashes = read_hashes
      if encrypted = read_hashes[key]
        message = decrypt(encrypted, salt)
      else
        puts "No such key: #{key}"
      end
    end
    
    protected
    def encrypt(message)
      salt = Time.now.to_s
      puts "ENCRYPTING WITH --#{salt}--"
      cipher = get_cipher(salt)
      cipher.encrypt
      cipher.update(message) 
      return Base64.encode64(cipher.final), salt
    end
    
    def decrypt(message, salt)
      puts "DECRYPTING WITH --#{salt}--"
      cipher = get_cipher(salt)
      cipher.decrypt
      cipher.update(Base64.decode64(message))
      return cipher.final
    end
    
    def get_cipher(salt)
      cipher = OpenSSL::Cipher::AES128.new(:CBC)
      cipher.key = salt
      cipher
    end
    
    def save_hashes(hashes)
      File.open(HASH_FILE, "w") do |f|
        hashes.each do |key, value|
          puts "SAVING #{key},#{value}"
          f.puts("#{key},#{value}")
        end
      end
    end
    
    def read_hashes
      hashes = {}
      if File.exists?(HASH_FILE)
        File.open(HASH_FILE, "r").each_line do |line|
          line_parts = line.split(',')
          hashes[line_parts[0]] = line_parts[1]
        end
      end
      hashes
    end
  end
end