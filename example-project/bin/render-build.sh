set -o errexit

# Build commands for front end to create the production build
rm -rf public
npm install --prefix client && npm run build --prefix client
cp -a client/build/. public/

# Build commands for back end
bundle install
bundle exec rake db:migrate 
bundle exec rake db:seed