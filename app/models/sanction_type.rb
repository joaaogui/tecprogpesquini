# File: sanction_type.rb
# Purpouse: The sanction_type model, stores all the information about the types of sanctions used.
# License: GPL v3
# Group 10 Tecprog
# FGA - Universidade de Brasília - Campus Gama

class SanctionType < ActiveRecord::Base

	has_many :sanctions
	validates_uniqueness_of :description

	# refresh the enterprises by sanction type.
	# @param sanction_description
	def refresh!

		# stores the sanction found in the search.
		sanctions_description = SanctionType.find_by_description(self.description)

		return sanctions_description

		Preconditions.check_not_nil(sanctions_description)

	end

	# informs all the types of sanctions.
	# @param sanction_types
	def self.all_sanction_types

		# stores all the sanction types.
		sanction_types = [
		[ "INIDONEIDADE - LEGISLAçãO ESTADUAL", "Inidoneidade - Legislação Estadual"],
		[ "IMPEDIMENTO - LEI DO PREGãO", "Impedimento - Lei do Pregão"],
		[ "PROIBIçãO - LEI ELEITORAL", "Proibição - Lei Eleitoral"],
		[ "INIDONEIDADE - LEI DE LICITAçõES","Inidoneidade - Lei de Licitações"],
		[ "SUSPENSãO - LEI DE LICITAçõES","Suspensão - Lei de Impedimento Licitações"],
		[ "SUSPENSãO - LEGISLAçãO ESTADUAL", "Suspensão - Legislação estadual"],
		[ "PROIBIçãO - LEI DE IMPROBIDADE", "Proibição - Lei de improbidade"],
		[ "DECISãO JUDICIAL LIMINAR/CAUTELAR QUE IMPEçA CONTRATAçãO","Decisão Judicial liminar"] ,
		[ "INIDONEIDADE - LEI DA ANTT E ANTAQ ","Inidoneidade - Lei da ANTT e ANTAQ"] ,
		[ "INIDONEIDADE - LEI ORGâNICA TCU", "Inidoneidade - Lei Orgânica TCU"],
		[ "IMPEDIMENTO - LEGISLAçãO ESTADUAL", "Impedimento - Legislação Estadual"],
		[ "SUSPENSãO E IMPEDIMENTO - LEI DE ACESSO à INFORMAçãO","Suspensão e Impedimento - Lei de Acesso à Informação"],
		[ "PROIBIçãO - LEI ANTITRUSTE", "Proibição - Lei Antitruste"],
		[ "IMPEDIMENTO - LEI DO RDC", "Impedimento - Lei do RDC"],
		[ "PROIBIçãO - LEI AMBIENTAL", "Proibição - Lei Ambiental" ],
		]

		return sanction_types

		Preconditions.check_not_nil(sanction_types)
		assert @sanction_types.empty?, "Sanction Type array must not be null"
		
	end
	
end
