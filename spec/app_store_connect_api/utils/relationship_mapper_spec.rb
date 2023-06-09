# frozen_string_literal: true

RSpec.describe AppStoreConnectApi::Utils::RelationshipMapper do
  describe '.expand' do
    subject(:expand) { described_class.expand relationships }

    let(:relationships) { { app_store_version: 'app-store-version-id' } }

    it "expands the relationship shorthand to the full format" do
      expect(expand).to eq app_store_version: { data: { id: 'app-store-version-id', type: 'appStoreVersions' } }
    end

    context 'when there are multiple relationships' do
      let(:relationships) { { app_store_version: 'app-store-version-id', app: 'app-id' } }

      it {
        is_expected.to eq app_store_version: { data: { id: 'app-store-version-id', type: 'appStoreVersions' } },
                          app: { data: { id: 'app-id', type: 'apps' } }
      }
    end

    context 'when some of the relationships are plural' do
      let(:relationships) { { app: 'app-id', beta_groups: ['beta-group-id1', 'beta-group-id2'] } }

      it {
        is_expected.to eq app: { data: { id: 'app-id', type: 'apps' } },
                          beta_groups: { data: [{ id: 'beta-group-id1', type: 'betaGroups' },
                                                { id: 'beta-group-id2', type: 'betaGroups' }] }
      }
    end

    context 'when the relationships are not in shorthand format' do
      let(:relationships) do
        { app: { data: { id: 'app-id', type: 'apps' } },
          beta_groups: { data: [{ id: 'beta-group-id1', type: 'betaGroups' },
                                { id: 'beta-group-id2', type: 'betaGroups' }] } }
      end

      it "doesn't change the relationships" do
        expect(expand).to eq relationships
      end
    end

    context 'when some relationships have to be translated to a different type' do
      subject(:expand) { described_class.expand relationships, type_translations }

      let(:relationships) { { individual_tester: 'beta-tester-id', visible_apps: ['app-id'] } }
      let(:type_translations) { { 'individualTesters' => 'betaTesters', 'visibleApps' => 'apps' } }

      it {
        is_expected.to eq individual_tester: { data: { id: 'beta-tester-id', type: 'betaTesters' } },
                          visible_apps: { data: [{ id: 'app-id', type: 'apps' }] }
      }

      context 'when type translations contain a wildcard' do
        let(:type_translations) { { '*' => 'resources' } }

        it {
          is_expected.to eq individual_tester: { data: { id: 'beta-tester-id', type: 'resources' } },
                            visible_apps: { data: [{ id: 'app-id', type: 'resources' }] }
        }
      end
    end
  end

  describe '.resource_keys' do
    subject(:resource_keys) { described_class.resource_keys ids, resource_type }

    let(:ids) { ['id1', 'id2'] }
    let(:resource_type) { 'apps' }

    it 'translates the list of ids in shorthand format into a list of resource keys' do
      expect(resource_keys).to eq [{ id: 'id1', type: 'apps' }, { id: 'id2', type: 'apps' }]
    end

    context 'when the ids are not in shorthand format' do
      let(:ids) { [{ id: 'id1', type: 'apps' }, { id: 'id2', type: 'apps' }] }

      it 'does not do any translation' do
        expect(resource_keys).to eq ids
      end
    end
  end
end
