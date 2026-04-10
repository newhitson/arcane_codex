module Api
  module V1
    class SpellsController < ApplicationController
      def index
        spells = Spell.all

        spells = spells.by_level(params[:level]) if params[:level]
        spells = spells.by_school(params[:school]) if params[:school]
        spells = spells.for_class(params[:char_class]) if params[:char_class]
        spells = spells.rituals if params[:ritual] == 'true'
        spells = spells.concentration if params[:concentration] == 'true'

        sort_col = %w[name level school].include?(params[:sort]) ? params[:sort] : 'name'
        sort_dir = params[:direction] == 'desc' ? 'desc' : 'asc'
        spells = spells.order("#{sort_col} #{sort_dir}")

        render json: spells, each_serializer: SpellSerializer
      end

      def show
        spell = Spell.find(params[:id])
        render json: spell, serializer: SpellSerializer
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Spell not found' }, status: :not_found
      end
    end
  end
end
