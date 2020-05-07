class TransactionSerializer
    def initialize(transactions)
        @transactions = transactions
    end

    def to_serialized_json
        sorted = @transactions.sort_by &:created_at
        sorted.to_json({
            include: {
                stock: {only: [:stock_symbol, :company_name]}
            }, except:[:stock_id, :user_id, :updated_at]
        })
    end
end