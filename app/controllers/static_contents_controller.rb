class StaticContentsController < ApplicationController
  ActiveContents = %w{homepage}.freeze

  ActiveContents.each do |content|
    self.class_eval <<-EOT
      def #{content}
      end
    EOT
  end
end
