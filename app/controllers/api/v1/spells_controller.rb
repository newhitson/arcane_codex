module Api
  module V1
    class SpellsController < ApplicationController
      def index
        if params[:q].present?
          search_options = {
            where: build_filters,
            aggs: [:school, :level, :classes, :ritual, :concentration]
            page: params[:page],
            per_page: 20
          }
          @results = Spell.search(params[:q].presence || '*', **search_options)

        render json: {
          spells: ActiveModelSerializers::SerializableResource.new(
            @results, each_serializer: SpellSerializer
          ),
          facets:{
            schools: @results.aggs['school']['buckets'],
            levels: @results.aggs['level']['buckets'],
            classes: @results,aggs['classes']['buckets']
          },
          total: results.total_count
        }
      end

      def show
        spell = Spell.find(params[:id])
        render json: spell, serializer: SpellSerializer
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Spell not found' }, status: :not_found
      end

      private

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
