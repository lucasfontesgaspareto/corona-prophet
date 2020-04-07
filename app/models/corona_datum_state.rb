class CoronaDatumState < CoronaDatum
  belongs_to :state

  class << self
    def datasource_for(state, field, label)
      datasource_data_for where(state: state).chronologically.last(DATA_SOURCE_DAYS), field, label
    end

    def summary
      where(reported_at: minimum_created_at).conformatively
    end
  end
end