# frozen_string_literal: true

module Reality::Describers::Wikidata::Impl
  module Modules
    # Moderates a Flow topic.
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {Reality::Describers::Wikidata::Impl::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module ModerateTopic

      # What level to moderate at.
      #
      # @param value [String] One of "delete", "hide", "suppress", "restore", "unhide", "undelete", "unsuppress".
      # @return [self]
      def moderationState(value)
        _moderationState(value) or fail ArgumentError, "Unknown value for moderationState: #{value}"
      end

      # @private
      def _moderationState(value)
        defined?(super) && super || ["delete", "hide", "suppress", "restore", "unhide", "undelete", "unsuppress"].include?(value.to_s) && merge(mtmoderationState: value.to_s)
      end

      # Reason for moderation.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(mtreason: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
