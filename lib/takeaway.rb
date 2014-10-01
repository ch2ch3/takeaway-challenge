require 'rubygems'
require 'twilio-ruby'
require_relative 'twilio'

class Takeaway

	include Twilio

	attr_reader :client, :total_price

	MENU = {
		:popiah => 2,
		:sambal_kang_kong => 3,
		:hokkien_mee => 4,
		:char_kway_teow => 4,
		:century_egg_tofu => 4,
		:sliced_fish_soup => 5,
		:laksa => 5,
		:black_pepper_crab => 20
	}

	def show_menu
		puts "#  DISH".ljust(28) + "PRICE".rjust(8)
		MENU.each do |dish, price|
			puts "#{MENU.keys.index(dish)+1}.".ljust(3) + "#{dish.to_s.split("_").map(&:capitalize).join(" ")}".ljust(25) + "$#{'%.2f' % price}".rjust(8)
		end
	end

	def order(dish_number)
		buffer[MENU.keys[dish_number-1]] += 1
	end

	def buffer
		@buffer ||= Hash.new(0)
	end

	def show_current_order
		buffer.sort_by { |dish, quantity| quantity }
		print_order
		print_total_price
	end

	def print_order
		puts "YOUR ORDER".center(36)
		puts "#  DISH".ljust(28) + "QUANTITY".rjust(8)
		buffer.each do |dish, quantity|
			puts "#{buffer.keys.index(dish)+1}.".ljust(3) + "#{dish.to_s.split("_").map(&:capitalize).join(" ")}".ljust(25) + "#{quantity}".rjust(8)
		end
	end

	def total_price
		total_price = 0
		buffer.each do |dish, quantity|
			total_price += (MENU[dish] * quantity)
		end
		total_price
	end

	def print_total_price
		puts "\nTotal price: #{'%.2f' % total_price}".ljust(36)
	end

	def place_order
		send_message
	end

end