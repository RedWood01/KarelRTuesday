
def move_until
	while front_is_clear?
		move		
	end
end
	
def move_until
	if front_is_clear?
		move
		move_until
	end
end

def put_beeper(n)
	unless (any_beepers_in_beeper_bag?==0)
		super
		put_beeper(n)
	end
end

def spirale

end
