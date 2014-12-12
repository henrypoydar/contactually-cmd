require "contactually/version"

module Contactually

  class Tasks
    def list
      connection = Connection.new
      puts connection.tasks_list
    end
  end

  class Connection
    include HTTParty
    base_uri 'www.contactually.com'

    def initialize
      @options = { query: {api_key: '8c9ssehg6r6dkvdvfbngix1dfrerhkz2' } }
    end

    def tasks_list
      self.class.get("/api/v1/tasks", @options)
    end
  end

end
