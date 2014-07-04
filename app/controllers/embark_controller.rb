class EmbarkController < ApplicationController

def home
end

def adventures
	p '*'*100
	p params
	p '*'*100
  @adventures = Adventure.all
end

def description
end


end