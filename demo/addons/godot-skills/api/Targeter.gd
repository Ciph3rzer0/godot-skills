# Targeters are responsible for acquiring a unique list of nodes as "targets".
# Targeters are responsible for locating nodes that meet given criteria.
# They may update manually with every request for targets.
# They may update automatically as nodes are added / removed from the tree.
# All depends on the criteria sought after and what the most efficient algorithm
#     is for locating nodes based on that criteria.
extends "SkillDescendant.gd"

# The set of targets for this Targeter. Only used if is_state is false
var targets = []

# If true, SkillSystem processes get_targets and stores results for all Targeters of this type.
# If false, each individual Targeter of this type finds its own targets
var static = false setget _set_static, _is_static

func _enter_tree():
    _skill_cache_list = "targeters"

# Acquires the targets for this Targeter
# Note, this method will be completely replaced in derived implementations
# 
# @return Array
func get_targets():
    pass

func _set_static(p_is_static):
    static = p_is_static

func _get_static():
    return static