require 'unteilbar/version'
require 'unteilbar/csv_reader'

module Unteilbar
  Signer = Struct.new(:name, :orga, :region, :newsletter)
  Subscriber = Struct.new(:name, :email, :region)


  # signatures by wp-forms
  #
  class Signatures
    def initialize(filename)
      @reader = CsvReader.new(filename)
    end

    # generates html-file -
    # each signer as li-element
    #
    def to_html
      File.open('./signer.html', 'wb') do |file|
        @reader.signer.each do |signer|
          file.puts create_line(signer)
        end
      end
    end

    private

    def create_line(signer)
      puts signer.inspect
      res = "<li>"
      res += signer.name if signer.name
      res += " (#{signer.orga})" if signer.orga
      res += " - #{signer.region}" if signer.region
      res += "</li>"
    end
  end
end
