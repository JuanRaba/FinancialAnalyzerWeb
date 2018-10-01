Rails.application.routes.draw do
  get 'clp/ufsCharts', to: 'clp#ufsCharts'
  get 'clp/dolarCharts', to: 'clp#dolarCharts'
  get 'tmc', to: 'tmc#index'
  root to: "clp#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
