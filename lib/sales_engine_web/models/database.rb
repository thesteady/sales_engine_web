module SalesEngineWeb
  class Database

    def self.database
      @database ||= Sequel.sqlite(
                          "./db/sales_engine_web_#{environment}.sqlite3"
                          )
    end

    def self.destroy
      if environment == :test
        system "rm './db/sales_engine_web_test.sqlite3'"
      else
        raise "Go do it yourself!"
      end
    end

    def self.merchants
      unless tables.include?(:merchants)
        build_table(:merchants)
      end
      database[:merchants]
    end

    def self.invoices
      unless tables.include?(:invoices)
        build_table(:invoices)
      end
      database[:invoices]
    end

    def self.customers
      unless tables.include?(:customers)
        build_table(:customers)
      end
      database[:customers]
    end

    def self.items
      unless tables.include?(:items)
        build_table(:items)
      end
      database[:items]
    end

    def self.transactions
      unless tables.include?(:transactions)
        build_table(:transactions)
      end
      database[:transactions]
    end

    def self.invoice_items
      unless tables.include?(:invoice_items)
        build_table(:invoice_items)
      end
      database[:invoice_items]
    end

    def self.tables
      @tables ||= []
    end

    def self.build_table(table)
      tables << table
    end

    def self.environment=(input)
      @environment = input
    end

    def self.environment
      @environment ||= :development
    end
  end
end
