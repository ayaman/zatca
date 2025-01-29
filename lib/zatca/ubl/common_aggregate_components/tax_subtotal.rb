class ZATCA::UBL::CommonAggregateComponents::TaxSubtotal < ZATCA::UBL::BaseComponent

  def initialize(taxable_amount:, tax_amount:, currency_id: "SAR", tax_category:)
    super()

    @taxable_amount = taxable_amount
    @tax_amount = tax_amount
    @currency_id = currency_id
    @tax_category = tax_category || ZATCA::UBL::CommonAggregateComponents::TaxCategory.new
  end

  def name
    "cac:TaxSubtotal"
  end

  def elements
    [
      ZATCA::UBL::BaseComponent.new(name: "cbc:TaxableAmount", value: @taxable_amount, attributes: {"currencyID" => @currency_id}),
      ZATCA::UBL::BaseComponent.new(name: "cbc:TaxAmount", value: @tax_amount, attributes: {"currencyID" => @currency_id}),
      @tax_category
    ]
  end
 end
