Rails.application.routes.draw do
  root 'home#nocache'

  controller 'home' do
    get 'nocache'
    get 'public'
    get 'private'
    get 'shared_only'
    get 'bit_of_ajax'
    post 'api_example_1'
  end
end
