class CoronaDatum::Importer
  def run
    truncate_table
    persist_data_state_from_csv
    persist_data_country_from_csv
  end

  private
    def truncate_table
      CoronaDatum.delete_all
    end

    def persist_data_state_from_csv
      extract_state_csv.each do |row|
        CoronaDatumState.create! reported_at: row['date'], state: find_or_initialize_state_by(row['state']), confirmed: row['totalCases'], deaths: row['deaths']
      end
    end

    def persist_data_country_from_csv
      extract_country_csv.each do |row|
        CoronaDatumCountry.create! reported_at: row['date'], confirmed: row['totalCases'], deaths: row['deaths']
      end
    end

    def find_or_initialize_state_by(name)
      State.find_or_initialize_by(name: name)
    end

    def extract_state_csv
      build_csv.select { |r| r['state'] != 'TOTAL' && r['date'].to_date < Date.current }
    end

    def extract_country_csv
      build_csv.select { |r| r['state'] == 'TOTAL' && r['date'].to_date < Date.current }
    end

    def build_csv
      CSV.new(open(resource_url), headers: true)
    end

    def resource_url
      'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'
    end
end
