class Riseup::Node::Welcome < RiseupBot



	def prepare_data(data)
		super
		p "Preparing #{self.class} from overriding class"
	end
end
