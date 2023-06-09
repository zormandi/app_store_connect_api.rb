# frozen_string_literal: true

module AppStoreConnectApi
  module Domain
    module BetaTesterInvitations
      # @see https://developer.apple.com/documentation/appstoreconnectapi/send_an_invitation_to_a_beta_tester
      def create_beta_tester_invitation(relationships)
        post '/v1/betaTesterInvitations', data: { relationships: Utils::RelationshipMapper.expand(relationships),
                                                  type: 'betaTesterInvitations' }
      end
      alias invite_beta_tester create_beta_tester_invitation
    end
  end
end
