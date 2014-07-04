class EmbarkController < ApplicationController

def home

end

def adventures
  @adventures = Adventure.all
end

def description
end


end