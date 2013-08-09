class Miane < ActiveRecord::Base
  attr_accessible :aims, :expected_result, :why_ngs,
  				:possible_alternative, :approach, :positive_control,
  				:negative_control, :replicates, :reference_dataset,
  				:possible_pittfalls, :needs_qc, :project_id, :construct

  belongs_to :project



  validates :aims, presence: true, length: { minimum: 20 } #  validates :expected_result, presence: true
  validates :why_ngs, presence: true
  validates :possible_alternative, presence: true
  validates :approach, presence: true
  validates :positive_control, presence: true
  validates :negative_control, presence: true
  validates :replicates, presence: true
  validates :reference_dataset, presence: true
  validates :possible_pittfalls, presence: true
  validates :needs_qc, presence: true



end
