Rails.application.routes.draw do
  root 'static_pages#index'

  get 'anime/search' => 'anime#search'
  get '*unmatched_route' => 'error#routing'
end
