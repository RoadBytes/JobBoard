Rails.application.routes.draw do
  root to: 'job_searches#new'
  get 'job_searches/index'
end
