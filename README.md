# Application Information

	** App Versions **
		Ruby Version  - 2.0.0-p195
		Rails Version - 4.0.0

	** Database **
		Primary Data Store - PostgreSQL
		ORM                - Active Record

	** Server **
		Uses Unicorn

	** File Uploads **
		File Upload Gem   - Carrierwave
		File Upload Store - Amazon S3
		Notes             - Cloud uploads through Fog, Image processing through ImageMagick

	** Background Processing **
		Undecided (?)

	** Testing **
		Unit Tests        - RSpec
		Factories         - Factory Girl
		Integration Tests - Capybara

	** Environment Variables **

# Getting Started

	1. Create a config/database.yml file in accordance with the config/example_database.yml template
	2. Create the corresponding postgres database locally
	3. Run `rake db:migrate` and `rake db:migrate RAILS_ENV=test` commands to configure your development and test databases
	4. Run the `rspec` command to make sure that all tests are passing
	5. Start the web server with the `unicorn` command ( defaults to port 8080 )
	6. Tail the development log with `tail -t log/development.log`
