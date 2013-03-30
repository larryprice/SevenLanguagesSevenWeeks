class CsvRow
  def initialize(contents)
    @contents = contents
  end

  def method_missing(name, *args)
    @contents[name.to_s]
  end

  attr_reader :contents
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def each(&block)
      @csv_contents.each(&block)
    end

    def read
      @csv_contents = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each_with_index do |row|
        @csv_contents << CsvRow.new(Hash[@headers.zip row.chomp.split(', ')])
      end
    end

    def initialize
      read
    end

    attr_reader :headers, :csv_contents
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
