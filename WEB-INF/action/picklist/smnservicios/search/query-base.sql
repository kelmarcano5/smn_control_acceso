select	
	smn_base.smn_servicios.*
from
	smn_base.smn_servicios 
where
	smn_servicios_id is not null
	${filter}