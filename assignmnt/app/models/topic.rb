class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :permalink, :title , :tag_ids

  belongs_to :forum
  has_many :comments, :dependent => :destroy

  before_validation :generate_permalink, on: :create

  has_many :topic_tags
  has_many :tags , :through => :topic_tags


  def to_param
  	permalink.present? ? permalink : "created_at.strftime('%y%m%d%H%L')}_#{name}".parameterize.underscore.dasherize
  end

  def generate_permalink
  	self.permalink = "#{Time.now.strftime('%y%m%d%H%L')}-#{self.name}".parameterize.underscore.dasherize rescue "#{Time.now.strftime('%y%m%d%H%L')}"
  end

  def self.find(*args)
    return to_a.find { |*block_args| yield(*block_args) } if block_given?

    options = args.extract_options!

    if options.present?
      apply_finder_options(options).find(*args)
    else
      case args.first
      when :first, :last, :all
        send(args.first)
      else
        find_by_permalink(*args) || super(*args)
     end
   end
  end

  def associated_tags
    self.tags.map(&:name).join(',') rescue ''
  end
end
