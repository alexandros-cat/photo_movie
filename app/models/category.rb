class Category < ActiveHash::Base
self.data = [
    { id: 1, name: '--' },
    { id: 2, name:'Forest' },
    { id: 3, name:'Town' },
    { id: 4, name:'Sea' },
    { id: 5, name:'Field' },
    { id: 6, name:'Mountain' },
    { id: 7, name:'Other' },
]

include ActiveHash::Associations
has_many :posts
end
