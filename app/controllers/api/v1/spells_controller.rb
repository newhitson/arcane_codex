module Api
  module V1
    class SpellsController < ApplicationController
      def index
        if params[:q].present?
          search_options = {
            where: build_filters,
            oder: build_sort,
            page: params[:page],
            per_page: 20
          }
          spells = Spell.search(params[:q], **search_options)
        else
          spells = Spell.includes(:spell_school)
          spells = apply_filters(spells)
          sort_col = %w[name level school].include?(params[:sort]) ? params[:sort] : 'name'
          sort_dir = params[:direction] == 'desc' ? 'desc' : 'asc'
          spells = spells.order("#{sort_col} #{sort_dir}")
        end

        render json: spells, each_serializer: SpellSerializer
      end

      def show
        spell = Spell.find(params[:id])
        render json: spell, serializer: SpellSerializer
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Spell not found' }, status: :not_found
      end

      private

      def apply_filters(spells)
          spells = spells.by_level(params[:level]) if params[:level]
          spells = spells.by_school(params[:school]) if params[:school]
          spells = spells.for_class(params[:char_class]) if params[:char_class]
          spells = spells.rituals if params[:ritual] == 'true'
          spells = spells.concentration if params[:concentration] == 'true'
      end

      def build_filters
        filters = {}
        filters[:level] = params[:level].to_i if params[:level]
        filters[:school] = params[:school] if params[:school]
        filters[:classes] = params[:char_class] if params[:char_class]
        filters[:ritual] = params[:ritural] == 'true' if params[:ritural]
        filters 
      end
    end
  end
end
