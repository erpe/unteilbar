require 'csv'

module Unteilbar
  class CsvReader
    def initialize(filename)
      @data = []
      CSV.foreach(filename, headers: true) do |row|
        @data << row.to_a
      end
    end

    def data
      @data
    end

    # schema from  wp-form
    # export
    #
    def signer
      @data.each_with_object([]) { |item, arr| arr.push(create_signer(item)) }
    end

    private

    def create_signer(arr)
      Signer.new(arr[0][1], arr[1][1], arr[2][1], arr[3][1])
    end
  end
end
