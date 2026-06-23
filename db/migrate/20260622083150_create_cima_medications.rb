class CreateCimaMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :cima_medications do |t|
      # External CIMA identifier
      t.string :nregistro, null: false

      # Main display/search fields
      t.string :name, null: false
      t.string :normalized_name
      t.text :active_ingredients_text
      t.string :laboratory_holder_name
      t.string :prescription_conditions
      t.string :dose

      # Authorization/registration status
      t.string :authorization_status, null: false, default: "unknown"
      t.date :authorized_on
      t.date :suspended_on
      t.date :revoked_on

      # CIMA flags
      t.boolean :commercialized, null: false, default: false
      t.boolean :requires_prescription
      t.boolean :affects_driving
      t.boolean :black_triangle
      t.boolean :orphan_medicine
      t.boolean :biosimilar
      t.boolean :ema_authorized
      t.boolean :has_supply_problem, null: false, default: false
      t.boolean :has_notes, null: false, default: false
      t.boolean :has_safety_materials, null: false, default: false

      # Sync tracking
      t.datetime :source_first_seen_at
      t.datetime :source_last_seen_at
      t.datetime :last_synced_at
      t.string :last_seen_batch_id
      t.string :payload_hash

      # Local deprecated status
      t.datetime :deprecated_at
      t.string :deprecated_reason

      # Import error tracking
      t.integer :import_error_count, null: false, default: 0
      t.text :last_import_error
      t.datetime :last_import_error_at

      # Original CIMA payload
      t.jsonb :raw_payload, null: false, default: {}

      t.timestamps
    end

    add_index :cima_medications, :nregistro, unique: true
    add_index :cima_medications, :name
    add_index :cima_medications, :normalized_name
    add_index :cima_medications, :laboratory_holder_name
    add_index :cima_medications, :commercialized
    add_index :cima_medications, :requires_prescription
    add_index :cima_medications, :has_supply_problem
    add_index :cima_medications, :authorization_status
    add_index :cima_medications, :deprecated_at
    add_index :cima_medications, :last_seen_batch_id
    add_index :cima_medications, :payload_hash
  end
end