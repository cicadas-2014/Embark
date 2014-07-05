class EmbarkController < ApplicationController

def home

end

def adventures
  @categories = ['Red','Blue','Green','Orange']
  @photos = ['http://www.christiantravelhub.com.au/wp-content/uploads/African-ladies-on-road.jpg','http://www.phototraces.net/wp-content/uploads/Travel_Photography_Blog_SanFrancisco_201111071.jpg','http://www.exposureguide.com/images/travel-basics/travel-photography4-e.jpg','http://designyoutrust.com/wp-content/uploads/2012/10/how-to-photography-making-the-most-of-your-travel-photography-1-750x500.jpg','http://chrismartinphotography.files.wordpress.com/2010/11/christopher_martin-7161.jpg','http://digital-photography-school.com/wp-content/uploads/2009/05/safe-travel-photography-tips.jpg','http://digital-photography-school.com/wp-content/uploads/old/travel-photography-1.jpg','http://blog.kenkaminesky.com/wp-content/uploads/p4/images/masthead_image1_1358639981.jpg','http://digital-photography-school.com/wp-content/uploads/2007/03/travel-photography-3-1.jpg','http://digital-photography-school.com/wp-content/uploads/old/travel-2.jpg','http://www.thisiscolossal.com/wp-content/uploads/2012/11/lukas-4.jpg','http://voyevoda.com/wp-content/uploads/2012/08/travel-photography-0048.jpg','http://dslrimage.com/wp-content/uploads/2014/05/village.jpg','http://travel.spotcoolstuff.com/wp-content/uploads/2009/11/best-travel-camera-m.jpg','http://1.bp.blogspot.com/-UZmtcQ5pLK8/UhQlFc2SN4I/AAAAAAAAA1g/uqbJBVHmVEE/s1600/machu-picchu-kelly-cheng-travel-photography.jpg','http://media.digitalcameraworld.com/files/2012/04/Travel_photography_tips.view_.jpg','http://takegreatpictures.com/app/webroot/content/2010_images/2010/12/19/3_travel_photography_tips.jpg','http://webneel.com/daily/sites/default/files/images/daily/10-2013/1-travel-photography.preview.jpg']
  all_adventures = Adventure.all
  @photo = @photos.sample(1)
  @adventures = all_adventures.shuffle.sample(21)
end

def description
end


end