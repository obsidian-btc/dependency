require_relative 'spec_init'

module StrictDependencyAttribute
  class SomeDependency
    def a_method; end
  end

  class Example
    extend Dependency::Macro

    dependency :some_dependency, SomeDependency
  end
end

context StrictDependencyAttribute::Example do
  context "Dependency attribute with a strict null object value" do

    test "The dependency doesn't respond to methods not on the impersonated interface" do
      begin
        subject.some_dependency.some_method
      rescue => error
      end

      assert error
    end

    test "The dependency responds to methods on the impersonated interface" do
      begin
        subject.some_dependency.a_method
      rescue => error
      end

      assert error
    end
  end
end
