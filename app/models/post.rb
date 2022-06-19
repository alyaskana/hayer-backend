class Post < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  has_many :responses, dependent: :destroy
  has_and_belongs_to_many :ad_types, dependent: :destroy

  has_many :favorites, dependent: :destroy

  enum format: {
    online: 'Онлайн',
    moscow: 'Москва',
    st_petersburg: 'Санкт-Петербург',
    nizhny_novgorod: 'Нижний Новгород',
    perm: 'Пермь'
  }
end
