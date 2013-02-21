require 'HTTParty'
require 'uri'
require 'json'


class Apicalltocb
	include HTTParty
	@dev_key = 'WDHF7PC72784BJ0NFBZC'


	def self.getJob(did)	
  	resp = get('http://api.careerbuilder.com/v1/job', :query => {:developerkey => @dev_key, :did => did})
    json_hash = resp.parsed_response
    return json_hash   
	end

	def self.getByKeyword(kywd,loc)		
  	resp = get('http://api.careerbuilder.com/v1/jobsearch', :query => {:developerkey => @dev_key, :Keywords => kywd, :Location => loc})
  	json_hash = resp.parsed_response        
    return json_hash
	end

end





