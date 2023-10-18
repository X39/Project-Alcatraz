#!/usr/bin/env python3
"""
Funcy SQF Function Maker
This tool will create functions for ArmA 3 Mods.
"""
import argparse
import os
import logging
from pathlib import Path

PARSER = argparse.ArgumentParser(prog='Funcy v1.0.1', description='Creates SQF functions',
                                 epilog="When using Funcy without the template flag (-t) the" +
                                 " created function will be blank.\nTo use a global template"+
                                 " for all functions create a file called 'template.fy' in"+
                                 " the directory Funcy is in. When creating a function Funcy"+
                                 " will take the content of this template file for all created"+
                                 " functions.\nIf you want to have a different template per"+
                                 " category then put a 'template.fy' file into the specific "+
                                 " directory ie. /addons/core/functions/template.py")
PARSER.add_argument('tag', help='the tag of your mod')
PARSER.add_argument('addon', help='the addon the function should be created for')
PARSER.add_argument('name', help='name of the function (without fn prefix)')
PARSER.add_argument('category', nargs="?", default="functions",
                    help='the category where the function is defined')
PARSER.add_argument('-v', '--verbose', dest='verbose', action='store_true',
                    help='prints log messages to follow the process')
PARSER.add_argument('-t', '--template', dest='template', action='store_true',
                    help='uses a template for creating function files')
PARSER.add_argument('-d', '--dry-run', dest='dryrun', action='store_true',
                    help='performs a dry run without changing any files')
PARSER.add_argument('-o', '--overwrite', dest='overwrite', action='store_true',
                    help='overwrites existing function entry and file')

ARGS = PARSER.parse_args()

logging.basicConfig(format='%(levelname)s - %(message)s', level=logging.INFO)
LOGGER = logging.getLogger("Funcy")
if ARGS.verbose:
    LOGGER.setLevel(logging.DEBUG)

def check_prerequisites():
    """Checks if the prerequisites for the execution are met"""
    LOGGER.debug("check prerequisites...")
    has_addons = os.path.isdir("addons") and os.path.exists("addons")
    addon_path = Path("addons/" + ARGS.addon)
    function_path = Path("{}/{}/fn_{}.sqf".format(addon_path, ARGS.category, ARGS.name))
    already_exists = function_path.exists()
    has_addons_folder = addon_path.is_dir() and addon_path.exists()
    has_category_folder = (addon_path / ARGS.category).is_dir() and (addon_path / ARGS.category).exists()
    has_config_file = (addon_path / "CfgFunctions.hpp").exists()

    if already_exists:
        if not ARGS.overwrite:
            LOGGER.warning("function %s already exists!", function_path)
            LOGGER.info("if you still want to create/overwrite it use the -o option")
            exit()
        else:
            LOGGER.warning("function file already exists!")
            LOGGER.warning("will overwrite file!")

    if not has_addons:
        LOGGER.error("no addons directory could be found at %s", os.getcwd())
        exit()
    if not has_addons_folder:
        LOGGER.error("%s could not be found in addons", ARGS.addon)
        exit()
    if not has_category_folder:
        LOGGER.error("%s could not be found", addon_path / ARGS.category)
        exit()
    if not has_config_file:
        if ARGS.verbose:
            LOGGER.error("looking for CfgFunctions.hpp in %s/%s/CfgFunctions.hpp",
                         os.getcwd(), addon_path)
        LOGGER.error("CfgFunctions.hpp could not be found in addons/")
        exit()

def read_config():
    """Reads the existing configuration file that needs to be extended"""
    LOGGER.debug("parse old CfgFunctions.hpp...")
    path_to_addon = Path("addons/" + ARGS.addon)
    path_to_config = path_to_addon / "CfgFunctions.hpp"
    LOGGER.info("open %s", path_to_config)

    with open(path_to_config, 'r') as config_file:
        return config_file.readlines()

def contains_substring(the_list, substring):
    """Checks if a given substring is contained in an element of the list of strings"""
    for element in the_list:
        if substring in element:
            return True
    return False

def list_index_substring(the_list, substring):
    """Returns the index of the list element where a substring was found"""
    for index, element in enumerate(the_list):
        if substring in element:
            return index
    return -1

def validate_config_format():
    """Check if a given config format is valid in terms of Funcy"""
    old_config = read_config()
    LOGGER.info("validate CfgFunctions.hpp format...")
    if not contains_substring(old_config, "class CfgFunctions"):
        LOGGER.error("CfgFunctions class declaration was missing in config")
        LOGGER.error("was looking for: '%s'", "class CfgFunctions {...}")
        exit()
    if not contains_substring(old_config, "class " + ARGS.tag):
        LOGGER.error("mod tag '%s' is missing in CfgFunctions", ARGS.tag)
        LOGGER.error("was looking for: \n%s", "class CfgFunctions {\n\tclass " +
                     ARGS.tag + " {...}\n}")
        exit()
    if not contains_substring(old_config, "file ="):
        LOGGER.error("the 'file =' statement is missing")
        LOGGER.error("please use the CfgFunctions format that uses the 'Folder Path' style " +
                     " (check: https://community.bistudio.com/wiki/Arma_3_Functions_Library)")
        exit()
    category = "\\{}\\addons\\{}\\{}".format(ARGS.tag, ARGS.addon, ARGS.category)
    if not contains_substring(old_config, category):
        LOGGER.error("the folder path is missing in CfgFunctions")
        LOGGER.error("was looking for: \"file = ...%s\"", category)
        exit()

def modify_config():
    """Modify the configuration file by adding the new function"""
    old_config = read_config()
    path_to_addon = Path("addons/" + ARGS.addon)
    path_to_config = path_to_addon / "CfgFunctions.hpp.tmp"
    offset_to_functions = 1
    category = "\\{}\\addons\\{}\\{}".format(ARGS.tag, ARGS.addon, ARGS.category)
    LOGGER.debug("category string: %s", category)
    index_of_category = list_index_substring(old_config, category)
    func_name = "class {} {{}}".format(ARGS.name)

    if index_of_category == -1:
        LOGGER.error("category for file could not be found")
        LOGGER.error("was looking for: \"file = ...%s\"", category)
        exit()

    LOGGER.debug("index of category is: %s", str(index_of_category))
    old_value = old_config[index_of_category + offset_to_functions]
    LOGGER.debug("old_value is: %s", old_value.strip())
    index_of_class = old_value.find("class")
    tabs = old_value[0:index_of_class]
    LOGGER.info("add '%s' as new entry to CfgFunctions.hpp", func_name)

    if ARGS.dryrun:
        LOGGER.info("*dry run* will not write original config")
        return

    func_already_defined = contains_substring(old_config, func_name)

    if func_already_defined:
        LOGGER.warning("function name already defined in CfgFunctions.hpp!")
        if ARGS.overwrite:
            LOGGER.warning("overwrite is active - leave it as is")
        else:
            LOGGER.info("if you still want to create/overwrite it use the -o option")
            exit()
    else:
        LOGGER.debug("creating temporary CfgFunctions file")
        old_config.insert(index_of_category + offset_to_functions, tabs + func_name + ";\n")

    with open(path_to_config, 'w') as new_config_file:
        LOGGER.debug("creating temporary CfgFunctions file")
        new_config_file.writelines(old_config)

def find_template():
    """Find the template file to use as content for the new function file"""
    LOGGER.info("read template file...")
    script_path = os.path.dirname(os.path.realpath(__file__))
    path_to_template = Path(script_path + "/template.fy")

    with open(path_to_template, 'r') as template_file:
        temp_file = template_file.readlines()
        template_file.close()
        return temp_file

def create_func_file():
    """Creates a new function file in the category"""
    path_to_addon = Path("addons/" + ARGS.addon)
    file_name = "fn_" + ARGS.name + ".sqf"
    path_to_new_file = path_to_addon / ARGS.category / file_name
    LOGGER.info("create function file %s", path_to_new_file)

    if ARGS.template:
        template = find_template()
        if ARGS.dryrun:
            LOGGER.info("*dry run* will not create new function file")
            return
        with open(path_to_new_file, 'w') as new_func_file:
            new_func_file.writelines(template)
            new_func_file.close()

    else:
        if ARGS.dryrun:
            LOGGER.info("*dry run* will not create new function file")
            return
        with open(path_to_new_file, 'w') as new_func_file:
            new_func_file.writelines("")
            new_func_file.close()

def commit_config_change():
    """Commit the temporary config file change"""
    path_to_addon = Path("addons/" + ARGS.addon)
    path_to_temp_config = path_to_addon / "CfgFunctions.hpp.tmp"
    path_to_config = path_to_addon / "CfgFunctions.hpp"
    LOGGER.info("commit changes to %s", path_to_config)
    if ARGS.dryrun:
        LOGGER.info("*dry run* no commit needed")
        return

    with open(path_to_temp_config, 'r') as temp_config:
        temp_config_content = temp_config.readlines()
        with open(path_to_config, 'w') as original_config:
            original_config.writelines(temp_config_content)
            original_config.close()
        temp_config.close()
        LOGGER.debug("remove temp file %s", path_to_temp_config)
        os.remove(path_to_temp_config)


check_prerequisites()
validate_config_format()
modify_config()
create_func_file()
commit_config_change()

