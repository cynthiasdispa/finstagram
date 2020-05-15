configure do
    # Log queries to STDOUT in development
    if Sinatra::Application.development?
        set :database, {
        adapter: "sqlite3",
        database: "db/db.sqlite3"
        }
    else
        db = URI.parse(ENV['DATABASE_URL'] || 'postgres://uyotzdbesadrez:398ec94feab72996c199fdf3588711718c2e83e3b610ee1b74a221f95dbd28ce@ec2-54-147-209-121.compute-1.amazonaws.com:5432/db531k09s4jjl5')
        set :database, {
        adapter: "postgresql",
        host: db.host,
        username: db.user,
        password: db.password,
        database: db.path[1..-1],
        encoding: "utf8"
        }
    ​
    end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
