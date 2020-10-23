require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

Rack::MethodOverride

use SessionsController
use GamesController
use PlayersController
run ApplicationController
