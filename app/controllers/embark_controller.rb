class EmbarkController < ApplicationController

def home

end

def adventures
  adventure_holder = []
  @categories = Category.all
  all_adventures = Adventure.all
  all_adventures.each do |adv|
    if adv.image_url != "nil"
      adventure_holder << adv
    end
  end
  @adventures = adventure_holder.shuffle.sample(27)
end

def description
end


end