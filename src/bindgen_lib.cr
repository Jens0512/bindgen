require "tempfile"
require "json"
require "yaml"
require "set"

require "./bindgen/generator"
require "./bindgen/call_analyzer/helper"
require "./bindgen/call_analyzer/cpp_methods"
require "./bindgen/call_analyzer/crystal_methods"
require "./bindgen/call_generator/helper"
require "./bindgen/call_generator/cpp_methods"
require "./bindgen/call_generator/crystal_methods"
require "./bindgen/**"