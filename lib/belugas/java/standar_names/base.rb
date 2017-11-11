module Belugas
  module Java
    module StandardNames
      NAMES = {
        'postgresql' => {
          'standard_name' => 'postgresql',
          'categories' => ['Database']
        },
        'mysql' => {
          'standard_name' => 'mysql',
          'categories' => ['Database']
        },
        'org.mongodb' => {
          'standard_name' => 'mongodb',
          'categories' => ['Database']
        },
        'redis.clients' => {
          'standard_name' => 'redis',
          'categories' => ['Database']
        },
        'org.springframework' => {
          'standard_name' => 'springframework',
          'categories' => ['Framework']
        },
        'org.springframework.boot' => {
          'standard_name' => 'springframework',
          'categories' => ['Framework']
        }
      }.freeze
    end
  end
end
