// Copyright 2021, Data61, CSIRO (ABN 41 687 119 230)

?start: toplevel

?toplevel: declaration*

?declaration: entity_declaration -> entity_declaration
              | containment_declaration
              | channel_declaration
              | separator_declaration
              | require_declaration -> require_declaration

?entity_declaration: "(" "entity" entity_id ")"
?containment_declaration: "(" "containment" entity_id entity_id ")" 
?channel_declaration: "(" "channel" entity_id entity_id ")" 
?separator_declaration: "(" "separator" entity_id ")" 

?require_declaration: "(" "require" requirement ")"

?requirement: must_contain_requirement
              | must_be_separated_requirement
              | can_communicate_requirement
              | must_filter_requirement
              | neg_requirement
              | conj_requirement
              | disj_requirement

?must_contain_requirement: "(" "must_contain" entity_id entity_id ")"
?must_be_separated_requirement: "(" "must_be_separated" entity_id (entity_id)+ ")"
?can_communicate_requirement: "(" "can_communicate" entity_id entity_id ")"
?must_filter_requirement: "(" "must_filter" entity_id entity_id entity_id ")"
?neg_requirement: "(" "neg" requirement ")"

?conj_requirement: "(" "conj" (requirement)+ ")"
?disj_requirement: "(" "disj" (requirement)+ ")"

entity_id : ESCAPED_STRING
 
%import common.ESCAPED_STRING
%import common.WS
 
%ignore WS
