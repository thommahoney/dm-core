# TODO: make it so that a child_key is created with nullable => false if
#       @min == 1

module DataMapper
  module Associations
    module OneToOne
      class Relationship < DataMapper::Associations::OneToMany::Relationship
        def get(parent, query = nil)
          super.first
        end

        def set(parent, child)
          super(parent, [ child ].compact)
        end

        private

        # TODO: document
        # @api semipublic
        def initialize(name, child_model, parent_model, options = {})
          child_model ||= Extlib::Inflection.camelize(name)
          super
        end
      end # class Relationship
    end # module HasOne
  end # module Associations
end # module DataMapper
