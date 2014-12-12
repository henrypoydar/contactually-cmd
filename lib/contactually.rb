require "contactually/version"
require "httparty"
require 'terminal-table'

module Contactually

  class Tasks

    def initialize(api_key)
      @connection = Connection.new(api_key)
    end

    def list
      tasks = @connection.tasks_list
      rows = []
      tasks["tasks"].each do |t|
        if t['completed_at'].nil?
          time = Time.parse(t['due_date'])
          rows << [time.strftime('%e %b'), t['associated_contact']['full_name'], t['title']]
        end
      end
      table = Terminal::Table.new :rows => rows
      puts table
    end
  end

  class Connection
    include HTTParty
    base_uri 'www.contactually.com'

    def initialize(api_key)
      @options = { query: {api_key: api_key } }
    end

    def tasks_list
      self.class.get("/api/v1/tasks", @options)
    end
  end

end
