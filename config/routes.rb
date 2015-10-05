Rails.application.routes.draw do
  root 'home#nocache'

  controller 'home' do
    get 'nocache'
    get 'public'
    get 'private'
    get 'shared_only'
  end
end
