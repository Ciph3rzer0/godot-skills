# A Skill is a utility for automatically mapping N effects onto N target nodes.
# Saving an arrangement of Targeters and Effects under a root Skill in a Scene enables explicit 
#     definition of algorithms for gathering and manipulating nodes using Godot's Node Hierarchy.
extends Node

signal skill_applied(p_skill, p_source, p_params)

var ancestor_skill = null               # The Skill that owns this Skill, if applicable
var effects = []                        # cached list of descendant Effect nodes
var targeters = []                      # cached list of descendant Targeter nodes

# Acquires all targets from all Targeters and then applies all Effects to each target.
# DO NOT REPLACE
func apply(p_user, p_params):
    var targets = []
    for targeter in targeters:
        targets += targeter.get_targets()
    for target in targets:
        for effect in effects:
            effect.apply(p_user, target)

# Acquires all targets from all Targeters and then reverts all Effects on each target.
# DO NOT REPLACE
func revert(p_user, p_params):
    var targets = []
    for targeter in targeters:
        targets += targeter.get_targets()
    for target in targets:
        for effect in effects:
            effect.revert(p_user, target)

# Applies all effects to all targets.
# Then acquires all desired properties from each target.
# The properties are compiled into a Dictionary of Dictionaries.
# Then all effects are reverted on each target.
# Finally, the Dictionary of property key-value pairs is returned:
# {
#     "root/path/to/node"   : { "prop1" : value1, "prop2" : value2, etc. },
#     "root/path/to/node2"  : etc.
# }
func test_properties(p_source, p_target, p_props):
    pass

# Supplies the unique name for this Skill instance
# DO REPLACE
static func get_skill_name():
    return ""

func set_ancestors(p_skill):
    ancestor_skill = p_skill