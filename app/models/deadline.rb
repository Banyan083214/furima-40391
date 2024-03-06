class Deadline < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '経済' },
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end