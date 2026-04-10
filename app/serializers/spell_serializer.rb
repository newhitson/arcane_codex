class SpellSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :school_name, :casting_time,
             :range, :duration, :description, :ritual,
             :concentration, :classes, :components
    
  def school_name
    object.spell_school&.name || object.school
  end
end
