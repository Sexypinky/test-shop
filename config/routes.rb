Rails.application.routes.draw do
  devise_for :chels
  root 'static_pages#index'
  get 'page', to:'pages#show_page'
  get 'about_us', to:'static_pages#about_us'
  get 'update', to:'pages#update'
  get 'cabinet', to:'pages#cabinet'
  get 'banks', to:'banks#welcome'
  get 'banks/new', to:'banks#new'
  get 'banks/log_in', to:'checkbanks#new'
  get 'banks/score', to:'banks#score'
  get 'banks/show', to:'banks#show'
  get 'conversations', to:'conversations#show'
  get 'message', to:'conversations#message'
  post 'pages',to:'pages#create'
  delete'admin_pages',to:'pages#delete'
  patch'page',to:'pages#update'
  post'createbank1',to:'banks#createbank1'
  get 'cabinet/administration',to:'admin/administration#panel'
  get 'destroysession',to:'admin/checkbanks#destroyadm'
  get 'addmoney',to:'banks#addmoney'
  get 'zero',to: 'banks#zero'
  get 'newbanksedit',to: 'administration#newbanksedit'
  put 'banksedit',to:'administration#banksedit'
  post 'banksedit',to:'administration#banksedit'
  get 'banks/mytransactions',to:'banks#mytransactions'
  get 'chels/sign_out', to:'chels/sessions#destroy'
  delete 'chels/sign_out', to:'chels/sessions#destroy'
  get 'admin/alltransactions',to:'admin/transactions#show'
  get 'cards/search',to:'cards#search'
  post 'cards/result', to:'cards#result'
  get 'cards/buy', to:'cards#buy'
  get 'cards/mycc',to:'cards#mycc'
  get 'cards/allcc',to:'cards#allcc'
  get 'admin/newadmin', to:'admin/administration#newadmin'
  get 'chels', to:'chels#show'
  post 'admin/giveadmin', to:'admin/administration#giveadmin'
  get 'admin/alladmins', to:'admin/administration#alladmins'
  get 'admin/unadmin', to:'admin/administration#unadmin'
  get 'admin/newaddmoney', to:'admin/administration#newaddmoney'
  post 'admin/addmoney', to:'admin/administration#addmoney'
  delete 'admin/destroyadm',to:'admin/banks#destroyadm'
  resource :transactions
  resource :banks
resource :pages, only: [:show, :show_page]
  resources :tags, only: [:show]
resource :checkbanks
  resource :cards
  resources :personal_messages, only: [:create]
  resources :conversations, only: [:message, :show]

  namespace :admin do
    resource :checkbanks
    resource :banks
    resource :cards , except: [:mycc, :result, :search]
    resource :pages, except: [:show, :show_page]
    resources :pictures, only: [:create, :destroy]
    resources :transactions, only: [:show, :destroy]
    resources :checkbanks, only: [:show]
  end
  end

