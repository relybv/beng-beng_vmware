require 'spec_helper'

describe 'beng_vmware' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo"
          })
        end

        context "beng_vmware class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('beng_vmware') }
 
          it { is_expected.to contain_class('beng_vmware::params') }
          it { is_expected.to contain_class('beng_vmware::install').that_comes_before('beng_vmware::config') }
          it { is_expected.to contain_class('beng_vmware::config') }
          it { is_expected.to contain_class('beng_vmware::service').that_subscribes_to('beng_vmware::config') }

          it { is_expected.to contain_service('beng_vmware') }
          it { is_expected.to contain_package('beng_vmware').with_ensure('present') }

        end
      end
    end
  end
end
