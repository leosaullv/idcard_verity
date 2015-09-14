require 'yaml'
module IdcardVerity
  class Idcard
  	attr_reader :idcard

  	def initialize(idcard)
  	  @idcard  = idcard.to_s
      @geoinfo = load_geoinfo
  	end

    def idcard
      @idcard
    end

    def geoinfo
      @geoinfo
    end

  	def type
  	  return true if size == 18
  	  false
  	end

  	def size
      idcard.size
  	end

  	def body
  	  idcard.slice(0..-2)
  	end

  	def lastbit
  	  return idcard.slice(-1..-1) if type
  	  false
  	end

  	def address
  	  idcard.slice(0..5)
  	end

  	def others
  	  idcard.slice(-4..-2)
  	end
    
    def birth
      return idcard.slice(6..14) if type
      '19' + idcard.slice(6..12)
    end

    def year
      birth.slice(0..3).to_i
    end

    def month
      birth.slice(4..5).to_i
    end

    def day
      birth.slice(6..7).to_i
    end

  	def right?
      size == 15 || size == 18
  	end

  	def check_birth
      !(year < 1900 || month > 12 || month == 0 || day > 31 || day == 0)
  	end

  	def check_bit
  	  return true unless lastbit
  	  return true if lastbit == sysbit
  	end

  	def check_geoinfo
  	  address.length == 6
  	end

  	def sysbit
  	  sum = 0
      body.split('').each_with_index do |bit,i|
        sum += bit.to_i * weight(18 - i)
      end
      office_bit.at(sum.divmod(11).last)
  	end

  	def valid?
      right? && check_birth && check_bit && check_geoinfo
  	end

  	private

  	def weight i
      (2 ** (i-1)).divmod(11).last
  	end

  	def load_geoinfo
  	  yml = YAML.load_file(File.expand_path("../../../geo_info.yml", __FILE__))
      yml['geoinfo']
  	end

    def office_bit
      ['1', '0', 'x', '9', '8', '7', '6', '5', '4', '3', '2']
    end

  end
end


