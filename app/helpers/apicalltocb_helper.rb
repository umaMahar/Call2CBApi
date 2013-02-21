module ApicalltocbHelper




	def getError(node)
		  if  !@returnValue[node]["Errors"].nil? && !@returnValue[node]["Errors"].empty?
		  	@errMsg = @returnValue[node]["Errors"]["Error"]
		  end  

	end

	def getPages(node)
		  if !@returnValue[node]["TotalPages"].nil?
		  	@TotalPages = @returnValue[node]["TotalPages"]
		  end
	end


	def displayErr(node)
		getError(node)
		getPages(node)
		
		if node == "ResponseJobSearch"	&&  @errMsg.nil? && @TotalPages == '0'
			errMsg = "Search for '" + params[:value2] +"' and '"+ params[:value3] + "' did not return results."
		elsif node == "ResponseJob" &&  @TotalPages.nil?
			errMsg=@errMsg	
		end
		return errMsg

	end

	def displayIDResults
	  htmlID=" "
		applylink = @returnValue["ResponseJob"]["Job"]["ApplyURL"]
		j_title = @returnValue["ResponseJob"]["Job"]["JobTitle"]
		j_desc  = @returnValue["ResponseJob"]["Job"]["JobDescription"]
		j_loc		= @returnValue["ResponseJob"]["Job"]["LocationFormatted"]
		j_company = @returnValue["ResponseJob"]["Job"]["Company"]
		j_desc = CGI::unescapeHTML(j_desc)
		

		# return joblink
		# html << concat("<%=")+concat(label_tag(:q1, "Job Title:")) + concat("%>") + concat("<%=")+
 # 		concat(@returnValue["ResponseJob"]["Job"]["JobTitle"])+ concat("%>") + concat("<%=")+
 # 		concat(@returnValue["ResponseJob"]["Job"]["JobDescription"])+ concat("%>") + concat("<%=")+
 # 		concat(link_to "click to go to job", joblink) + concat("%>")

 		htmlID << "<h2>Company : " + j_company +"&nbsp&nbsp&nbsp&nbsp&nbspJob Title: "+ j_title +"</h2>"
    htmlID <<  "<br> Location: <b>" + j_loc + "</b>&nbsp&nbsp&nbsp&nbsp&nbspJob Apply Link: <b>"+(link_to "click to Apply to Job", applylink)+"</b>"
    htmlID <<   j_desc

     # htmlID << " Job Title: "+ j_title + "&nbsp&nbsp&nbsp&nbsp&nbsp" +" Location: " + j_loc
     # + "&para" + " Job Description: " + j_desc+ "&para" +" Job Apply Link: "+(link_to "click to Apply to Job", applylink)
	end

	def displayKeywordResults
		html = " "
		
		i=0
		@returnValue["ResponseJobSearch"]["Results"]["JobSearchResult"].each do |a| 
		 	j_link = a["JobDetailsURL"] || ""
			j_title = a["JobTitle"] || ""
			j_desc  = a["DescriptionTeaser"] || ""
			j_loc		= a["LocationFormatted"] || ""
			j_company = a["Company"] || ""
			j_desc = CGI::unescapeHTML(j_desc)
		 
		 	html<< "<h2>- Company : " + j_company +"&nbsp&nbsp&nbsp&nbsp&nbspJob Title: "+ j_title +"</h2>"
		 	if !j_loc.empty?
	 			html <<  "<br> Location: <b>" + j_loc + "</b>&nbsp&nbsp&nbsp&nbsp&nbsp"
	 		end
	    html<<   "<h5>"+j_desc+"</h5>"
	    html << "<b>"+(link_to "click for Details & Apply to Job", j_link)+"</b>"
	 		i +=1
	 		if i==10   
	 			break
	 		end
		end
		return html
	end

end

