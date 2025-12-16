# Rails 8 Simple Template
# A basic template for Rails 8 applications with essential setup

say "Applying Rails 8 Simple Template..."
#~ 010_PHASE_RubyVersion

# Add basic gems if not already present
#~ 030_PHASE_GemBundle_Development_Test
gem_group :development, :test do
  gem 'rspec-rails' unless File.read('Gemfile').include?('rspec-rails')
  gem 'factory_bot_rails'
  gem 'faker'
end

#~ 030_PHASE_GemBundle_Development
gem_group :development do
  gem 'annotate' unless File.read('Gemfile').include?('annotate')
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Create basic application layout improvements
#~ 040_PHASE_View_Markup
gsub_file 'app/views/layouts/application.html.erb', 
  '<title>Rails8Simple</title>', 
  '<title>Rails 8 Simple Application</title>'

# Add basic styling
#~ 040_PHASE_View_Styling
append_to_file 'app/assets/stylesheets/application.css', <<~CSS

  /* Basic styling for Rails 8 Simple */
  .welcome {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  }
  
  .welcome h1 {
    color: #2563eb;
    border-bottom: 2px solid #e5e7eb;
    padding-bottom: 0.5rem;
  }
  
  .welcome h2 {
    color: #374151;
    margin-top: 2rem;
  }
  
  .welcome ul {
    background: #f9fafb;
    padding: 1rem;
    border-radius: 0.5rem;
    border-left: 4px solid #2563eb;
  }
CSS

# Generate RSpec configuration
#~ 050_PHASE_Test
generate 'rspec:install'

# Create a basic controller
#~ 100_PHASE_Feature_Home_Controller
generate :controller, 'Welcome', 'index'

# Set up root route
#~ 100_PHASE_Feature_Home_Route
route "root 'welcome#index'"

# Add a basic welcome message
#~ 100_PHASE_Feature_Home_View_Markup
create_file 'app/views/welcome/index.html.erb', <<~HTML
  <div class="welcome">
    <h1>Welcome to Rails 8 Simple</h1>
    <p>This is a simple Rails 8 application created with git-template.</p>
    
    <h2>Features</h2>
    <ul>
      <li>Rails 8.0</li>
      <li>RSpec for testing</li>
      <li>Basic MVC structure</li>
      <li>Git-template integration</li>
    </ul>
    
    <h2>Next Steps</h2>
    <p>Start building your application by adding models, views, and controllers.</p>
  </div>
HTML

# Create a basic model example
#~ 100_PHASE_Feature_Post_Model
generate :model, 'Post', 'title:string', 'content:text', 'published:boolean'

# Run migrations
#~ 100_PHASE_Feature_Post_Model_Migrate
rails_command 'db:migrate'

# Add seeds
#~ 100_PHASE_Feature_Post_Model_Seed
append_to_file 'db/seeds.rb', <<~RUBY

# Sample data for Rails 8 Simple
Post.create!([
  {
    title: "Welcome to Rails 8",
    content: "This is your first post in the Rails 8 Simple application.",
    published: true
  },
  {
    title: "Getting Started",
    content: "Start building your application by customizing this template.",
    published: true
  }
])
RUBY

# Run seeds
rails_command 'db:seed'

#~ 900_PHASE_Complete
say "Rails 8 Simple Template applied successfully!", :green
say "Next steps:", :blue
say "  1. Start the server: bin/rails server"
say "  2. Visit http://localhost:3000"
say "  3. Customize your application"