class Post < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  has_many :responses
  has_and_belongs_to_many :ad_types

  enum format: { 
    online: "online", 
    moscow: "moscow", 
    st_petersburg: "st_petersburg", 
    nizhny_novgorod: "nizhny_novgorod",
    perm: "perm"
  }  
end
 