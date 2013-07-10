module Import
	require 'rubygems'
	require 'net/http'
	require 'json'
	require 'date'
	require 'nokogiri'

	def get_JSON(file)
		@deathList = []
		@infoSheet = {}
		file = File.open(file, "rb")
		contents = file.read
		file.close
		JSON.parse(contents).each do |item|
			# puts item['Execution']
			puts item["Date"]
			dateEx = Date.strptime(item["Date"], '%m/%d/%Y')
			@singleList = {
				:number => item["Execution"].to_i,
				:tdcj => item["TDCJ Number"],
				:first_name => item["First Name"],
				:last_name => item["Last Name"],
				:age => item["Age"],
				:race => item["Race"],
				:county => item["County"],
				:date_executed => dateEx.strftime("%Y-%m-%d"),
				:info_sheet => item["Information Sheet"],
				:last_statement => get_last_statement(item["Last Statement"])
			}
			# More Math
			@singleList.merge!(get_info_sheet(item["Information Sheet"]))
			if get_info_sheet(item["Information Sheet"]) != {}
				@singleList[:computed_age_executed] = @singleList[:date_executed].to_f - @singleList[:dob].to_f 
				if @singleList[:date_executed].is_a?(String) and @singleList[:date_received].is_a?(String)
					@singleList[:computed_days_between_received_and_executed] = (Date.strptime(@singleList[:date_executed], '%Y-%m-%d') - Date.strptime(@singleList[:date_received], '%Y-%m-%d')).to_i
				end
			end
			# Add to Big Hash
			@deathList.push(@singleList)
		end
		return @deathList
	end

	def grab_html(url)
		a = Net::HTTP.get_response(URI.parse(url))
		b = Nokogiri::HTML.parse(a.body)
		return b
	end

	def get_last_statement(url)
		if url == "http://www.tdcj.state.tx.us/death_row/dr_info/no_last_statement.html" or url == "http://www.tdcj.state.tx.us/death_row/dr_info/no_last_statement.html"
			return "None"
		else
			fetched = grab_html(url)
			ptags = fetched.xpath("//p")
			ptags.each_with_index {|p, index|
				if p.inner_text.include? "Last Statement:"
					nxt = ptags[index+1].inner_text
					return nxt
				end
			}
		end
	end


	def get_info_sheet(url)
		if url.include? ".html"
			dob, dr, ar, el, doo, aatof, gen, heig, weig, ec, poccu, ppr, sin, codef, ragov = ""
			@infoSheet = {}
			fetched = grab_html(url)
			tds = fetched.xpath("//td")
			tds.each_with_index {|td, index|
				if td.inner_text.include? "Age (when"
					# @infoSheet << {:age_when_recieved  => tds[index+1].inner_text}
					ar = tds[index + 1].inner_text
				end
				if td.inner_text.include? "Date of Birth"
					# @infoSheet << {:dob  => tds[index+1].inner_text}
					dob = tds[index + 1].inner_text
					dob = Date.strptime(dob, '%m/%d/%Y')
				end
				if td.inner_text.include? "Date Received"
					# @infoSheet << {:date_recieved  => tds[index+1].inner_text}
					dr = tds[index + 1].inner_text
					dr = Date.strptime(dr, '%m/%d/%Y')
				end
				if td.inner_text.include? "Education Level"
					# @infoSheet << {:edu_level  => tds[index+1].inner_text}
					el = tds[index + 1].inner_text
				end
				if td.inner_text.include? "Date of Offense"
					# @infoSheet << {:offense_date  => tds[index+1].inner_text}
					doo = tds[index + 1].inner_text
					doo = Date.strptime(doo, '%m/%d/%Y')
				end
				if td.inner_text.include? "Age (at"
					# @infoSheet << {:age_at_offense  => tds[index+1].inner_text}
					aatof = tds[index + 1].inner_text
				end
				if td.inner_text.include? "Gender"
					# @infoSheet << {:gender  => tds[index+1].inner_text}
					gen = tds[index + 1].inner_text
				end
				if td.inner_text.include? "Height"
					# @infoSheet << {:height  => tds[index+1].inner_text}
					heig = tds[index + 1].inner_text
				end
				if td.inner_text.include? "Weight"
					# @infoSheet << {:weight  => tds[index+1].inner_text}
					weig = tds[index + 1].inner_text
				end
				if td.inner_text.include? "Eye Color"
					# @infoSheet << {:eyes  => tds[index+1].inner_text}
					ec = tds[index + 1].inner_text
				end
			}
			ptags = fetched.xpath("//p")
			ptags.each_with_index {|p, index|
				if p.inner_text.include? "Prior Occupation"
					str = p.inner_text
					str.gsub!(/Prior Occupation/, "")
					# @infoSheet << {:prior_occupation  => str}
					poccu = str
				end
				if p.inner_text.include? "Prior Prison Record"
					str = p.inner_text
					str.gsub!(/Prior Prison Record/, "")
					# @infoSheet << {:prior_record  => str}
					ppr = str
				end
				if p.inner_text.include? "Summary of Incident"
					str = p.inner_text
					str.gsub!(/Summary of Incident/, "")
					# @infoSheet << {:summary  => str}
					sin = str
				end
				if p.inner_text.include? "Co-Defendants"
					str = p.inner_text
					str.gsub!(/Co-Defendants/, "")
					# @infoSheet << {:co_defendants  => str}
					codef = str
				end
				if p.inner_text.include? "Race and Gender of Victim"
					str = p.inner_text
					str.gsub!(/Race and Gender of Victim/, "")
					# @infoSheet << {:victim_info  => str}
					ragov = str
				end
			}
			# Math
			cawr = dr - dob unless dr.nil? or dob.nil?
			caao = doo - dob unless doo.nil? or dob.nil?
			ctba = dr - doo unless dr.nil? or doo.nil?
			@infoSheet = {
				:dob  => if dob.is_a?(Date)
										dob.strftime("%Y-%m-%d") 
								 end,
				:date_received  => if dr.is_a?(Date)
													 		dr.strftime("%Y-%m-%d") 
													 end,
				:age_when_received  => ar,
				:computed_age_recieved => cawr.to_i / 365.to_f,
				:edu_level  => el,
				:offense_date  => if doo.is_a?(Date)
														doo.strftime("%Y-%m-%d") 
													end,
				:computed_age_at_offense  => caao.to_i / 365.to_f,
				:computed_days_before_received_after_offense => ctba.to_i,
				:age_at_offense => aatof,
				:gender => gen,
				:height => heig,
				:weight => weig,
				:eyes => ec,
				:prior_occupation => poccu,
				:prior_record => ppr,
				:summary => sin,
				:co_defendants => codef,
				:victim_info => ragov
			}
			return @infoSheet
		else
			return {}
		end
	end

	def get_data()
		get_JSON('jsonifiedData.json')
	end
end