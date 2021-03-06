# Copyright (C) 2012-2016 Zammad Foundation, http://zammad-foundation.org/
module StatsStore::SearchIndex

  def search_index_attribute_lookup
    attributes = super
    return if !attributes

    begin
      return if !Kernel.const_get(attributes['stats_store_object'])

      record = Kernel.const_get(attributes['stats_store_object']).lookup(id: o_id)
      return if !record

      attributes['stats_store_object_ref'] = record.search_index_attribute_lookup
    rescue
      return
    end

    attributes
  end

end
