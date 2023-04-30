# frozen_string_literal: true

require_relative 'domain/app_store_version_localizations'
require_relative 'domain/app_store_version_phased_releases'
require_relative 'domain/app_store_version_release_requests'
require_relative 'domain/app_store_versions'
require_relative 'domain/apps'
require_relative 'domain/beta_app_localizations'
require_relative 'domain/beta_app_review_details'
require_relative 'domain/beta_app_review_submissions'
require_relative 'domain/beta_build_localizations'
require_relative 'domain/beta_groups'
require_relative 'domain/beta_license_agreements'
require_relative 'domain/beta_tester_invitations'
require_relative 'domain/beta_testers'
require_relative 'domain/build_beta_details'
require_relative 'domain/build_beta_notifications'
require_relative 'domain/builds'
require_relative 'domain/bundle_id_capabilities'
require_relative 'domain/bundle_ids'
require_relative 'domain/certificates'
require_relative 'domain/devices'
require_relative 'domain/prerelease_versions'
require_relative 'domain/profiles'
require_relative 'domain/review_submission_items'
require_relative 'domain/review_submissions'
require_relative 'domain/users'

module AppStoreConnectApi
  module Domain
    include AppStoreVersionLocalizations
    include AppStoreVersionPhasedReleases
    include AppStoreVersionReleaseRequests
    include AppStoreVersions
    include Apps
    include BetaAppLocalizations
    include BetaAppReviewDetails
    include BetaAppReviewSubmissions
    include BetaBuildLocalizations
    include BetaGroups
    include BetaLicenseAgreements
    include BetaTesterInvitations
    include BetaTesters
    include BuildBetaDetails
    include BuildBetaNotifications
    include Builds
    include BundleIdCapabilities
    include BundleIds
    include Certificates
    include Devices
    include PrereleaseVersions
    include Profiles
    include ReviewSubmissionItems
    include ReviewSubmissions
    include Users
  end
end
