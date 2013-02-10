# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :overview, :only => ["index"]
namespace :overview do
  resources :team_members, :only => [:show]
end
