class EmbarkController < ApplicationController

def home

end

def adventures
  @categories = Category.all
  all_adventures = Adventure.all
  @adventures = all_adventures.sample(21)
end

def description
	@adventure = Adventure.find(parmas[:id])
	
end


end