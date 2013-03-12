require 'HTTParty'
require 'uri'
require 'json'


class Apicalltocb
	include HTTParty
<<<<<<< HEAD

	def self.getJob(did,dev_key)	
  	resp = get('http://api.careerbuilder.com/v1/job', :query => {:developerkey => dev_key, :did => did})
=======
	@dev_key = 'WDHF7PC72784BJ0NFBZC'


	def self.getJob(did)	
  	resp = get('http://api.careerbuilder.com/v1/job', :query => {:developerkey => @dev_key, :did => did})
>>>>>>> 6a8bd422f118b853b87e094e104ad57b883a74d2
    json_hash = resp.parsed_response
    return json_hash   
	end

<<<<<<< HEAD
	def self.getByKeyword(kywd,loc,dev_key)		
  	resp = get('http://api.careerbuilder.com/v1/jobsearch', :query => {:developerkey => dev_key, :Keywords => kywd, :Location => loc})
=======
	def self.getByKeyword(kywd,loc)		
  	resp = get('http://api.careerbuilder.com/v1/jobsearch', :query => {:developerkey => @dev_key, :Keywords => kywd, :Location => loc})
>>>>>>> 6a8bd422f118b853b87e094e104ad57b883a74d2
  	json_hash = resp.parsed_response        
    return json_hash
	end

end





