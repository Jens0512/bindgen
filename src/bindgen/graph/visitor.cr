module Bindgen
  module Graph
    # A `Graph::Node` visitor module.  Use `#visit_node` as entry-point, and
    # override the remaining `#visit_X` methods as you require.
    module Visitor
      # Checks if *node* shall be visited.  Can be overriden in the host class
      # to only visit specific nodes.
      #
      # See `Generator::Base#visit_node?` for an example.
      def visit_node?(node : Node)
        true
      end

      # Visits *node*, calling out to the correct handler method.  Certain nodes
      # can be ignored by overriding `#visit_node?` and returning `false` from
      # there.
      def visit_node(node : Node)
        return unless visit_node?(node) # Do we care?

        case node
        when Graph::Alias
          visit_alias(node.as(Graph::Alias))
        when Graph::Class
          visit_class(node.as(Graph::Class))
        when Graph::Enum
          visit_enum(node.as(Graph::Enum))
        when Graph::Library
          visit_library(node.as(Graph::Library))
        when Graph::Method
          visit_method(node.as(Graph::Method))
        when Graph::Namespace
          visit_namespace(node.as(Graph::Namespace))
        when Graph::Struct
          visit_struct(node.as(Graph::Struct))
        when Graph::PlatformSpecific
          visit_platform_specific(node.as(Graph::PlatformSpecific))
        else
          raise "BUG: Missing case for type #{node.class} in Graph::Visitor"
        end
      end

      # Visits all children of *container*.
      def visit_children(container : Container)
        container.nodes.each do |child|
          visit_node(child)
        end
      end

      # Visits a `Graph::Alias`.
      def visit_alias(alias_name)
      end

      # Visits a `Graph::Class`.  The default implementation calls
      # `#visit_children` to visit all child nodes.
      def visit_class(klass)
        visit_children(klass)
      end

      # Visits a `Graph::Enum`.
      def visit_enum(enumeration)
      end

      # Visits a `Graph::Library`.  The default implementation calls
      # `#visit_children` to visit all child nodes.
      def visit_library(library)
        visit_children(library)
      end

      # Visits a `Graph::Method`.
      def visit_method(method)
      end

      # Visits a `Graph::Namespace`.  The default implementation calls
      # `#visit_children` to visit all child nodes.
      def visit_namespace(ns)
        visit_children(ns)
      end

      # Visits a `Graph::Struct`.
      def visit_struct(structure)
        visit_children(structure)
      end

      # Visits a `Graph::PlatformSpecific`.
      def visit_platform_specific(specific)
        visit_children(specific)
      end
    end
  end
end
