require_relative 'base_entity'

class EntityManager
  # Tags are: tile, player, bullet, enemy

  def initialize
    @entities = []
    @by_tag = {}
    @id_sn = 0
    @to_add = []
  end

  def update
    @to_add.each do |e|
      @entities << e
      @by_tag[e.tag] ||= []
      @by_tag[e.tag] << e
    end
    @to_add = []

    @entities.reject! {|e| !e.alive }
    @by_tag.each {|_, v| v.reject! {|e| !e.alive}}
  end

  def add(tag)
    BaseEntity.new(@id_sn, tag).tap do |e|
      @to_add << e
      @id_sn += 1
    end
  end


  def all
    @entities
  end

  def by_tag(tag)
    @by_tag[tag]
  end
end

