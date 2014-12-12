Rails.application.routes.draw do

  scope 'posts' do
    get ':year/(:month)/(:day)', to: 'posts#show', as: 'posts_by_date'
    get '', to: 'posts#index', as: 'posts'
  end

end
