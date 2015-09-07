module DealRecordsHelper

	def day_list
		(0..7).map {|d| ["#{d.day.ago.in_time_zone("Taipei").strftime('%m月%d日')}", local_date(d)]}
	end

	def local_date(d)
		d.day.ago.in_time_zone("Taipei")
	end

end
