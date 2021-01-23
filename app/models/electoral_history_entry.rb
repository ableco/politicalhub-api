class ElectoralHistoryEntry < ApplicationRecord
  belongs_to :person
  belongs_to :electoral_process
end
