class ZATCA::UBL::CommonAggregateComponents::TaxTotal < ZATCA::UBL::BaseComponent
  # <cac:TaxTotal>
  # <cbc:TaxAmount currencyID="SAR">144.9</cbc:TaxAmount>
  # <cac:TaxSubtotal>
  #     <cbc:TaxableAmount currencyID="SAR">966.00</cbc:TaxableAmount>
  #     <cbc:TaxAmount currencyID="SAR">144.90</cbc:TaxAmount>
  #     <cac:TaxCategory>
  #         <cbc:ID schemeAgencyID="6" schemeID="UN/ECE 5305">S</cbc:ID>
  #         <cbc:Percent>15.00</cbc:Percent>
  #         <cac:TaxScheme>
  #             <cbc:ID schemeAgencyID="6" schemeID="UN/ECE 5153">VAT</cbc:ID>
  #         </cac:TaxScheme>
  #     </cac:TaxCategory>
  # </cac:TaxSubtotal>
  # </cac:TaxTotal>

  def initialize(
    tax_amount:,
    rounding_amount: nil,
    currency_id: "SAR",
    tax_subtotal: []
  )
    super()

    @tax_amount = tax_amount
    @rounding_amount = rounding_amount
    @currency_id = currency_id
    @tax_subtotal = tax_subtotal
  end

  def name
    "cac:TaxTotal"
  end

  def rounding_amount_element
    if @rounding_amount.present?
      ZATCA::UBL::BaseComponent.new(name: "cbc:RoundingAmount", value: @rounding_amount, attributes: {"currencyID" => @currency_id})
    end
  end

  def elements
    elems = [
      ZATCA::UBL::BaseComponent.new(name: "cbc:TaxAmount", value: @tax_amount, attributes: {"currencyID" => @currency_id}),
      rounding_amount_element
    ]

    elems << @tax_subtotal if @tax_subtotal.present?
    elems
  end
end
