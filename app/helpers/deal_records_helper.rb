module DealRecordsHelper

	def day_list
		(0..7).map {|d| ["#{d.day.ago.strftime('%m月%d日')}", d.day.ago]}
	end

end
