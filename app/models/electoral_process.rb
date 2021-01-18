class ElectoralProcess < ApplicationRecord
  LAST_ELECTION_ID = 110
  DEPARTMENTS = %w[
    140101
    010000
    020000
    030000
    040000
    050000
    060000
    240000
    070000
    080000
    090000
    100000
    110000
    120000
    130000
    140000
    140100
    150000
    160000
    170000
    180000
    190000
    200000
    210000
    220000
    230000
    250000
  ]
  before_save :set_slug

  def set_slug
    self.slug ||= name.parameterize
  end
end
