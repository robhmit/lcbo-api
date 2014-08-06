class API::V2::ProductsQuery < API::V2::APIQuery
  model { Product }

  has_pagination
  has_include_dead

  by :id, limit: 100
  by :upc, type: :string, limit: 100

  toggle \
    :is_discontinued,
    :has_value_added_promotion,
    :has_limited_time_offer,
    :has_bonus_reward_miles,
    :is_seasonal,
    :is_vqa,
    :is_kosher

  sort [
    :id,
    :price_in_cents,
    :regular_price_in_cents,
    :limited_time_offer_savings_in_cents,
    :limited_time_offer_ends_on,
    :bonus_reward_miles,
    :bonus_reward_miles_ends_on,
    :package_unit_volume_in_milliliters,
    :total_package_units,
    :total_package_volume_in_milliliters,
    :volume_in_milliliters,
    :alcohol_content,
    :price_per_liter_of_alcohol_in_cents,
    :price_per_liter_in_cents,
    :inventory_count,
    :inventory_volume_in_milliliters,
    :inventory_price_in_cents,
    :released_on
  ]

  range :price_in_cents,                      type: :whole
  range :regular_price_in_cents,              type: :whole
  range :limited_time_offer_savings_in_cents, type: :whole
  range :limited_time_offer_ends_on,          type: :date
  range :bonus_reward_miles,                  type: :whole
  range :bonus_reward_miles_ends_on,          type: :date
  range :package_unit_volume_in_milliliters,  type: :whole
  range :total_package_units,                 type: :whole
  range :total_package_volume_in_milliliters, type: :whole
  range :volume_in_milliliters,               type: :whole
  range :alcohol_content,                     type: :whole
  range :price_per_liter_of_alcohol_in_cents, type: :whole
  range :price_per_liter_in_cents,            type: :whole
  range :inventory_count,                     type: :whole
  range :inventory_volume_in_milliliters,     type: :whole
  range :inventory_price_in_cents,            type: :whole
  range :released_on,                         type: :date

  param :q, type: :string do |q|
    scope.search(q)
  end
end