require 'takeaway'

describe Takeaway do

	let(:takeaway) { Takeaway.new }

	it "can list dishes and their prices" do
		expect(takeaway.respond_to?(:show_menu)).to be true
	end

	it "lets the customer select the dish to be ordered" do
		takeaway.order(1)
		expect(takeaway.buffer).to eq ({:popiah => 1})
	end

	it "keeps a list of ordered dishes and their quantities" do
		takeaway.order(1)
		takeaway.order(4)
		takeaway.order(1)
		expect(takeaway.buffer.size).to eq 2
	end

	it "can calculate the total price of the order" do
		takeaway.order(1)
		takeaway.order(8)
		expect(takeaway.total_price).to eq 22
	end

	it "places the order" do
		expect(takeaway).to receive(:send_message).and_return("Dummy text.")
		takeaway.place_order
	end

end