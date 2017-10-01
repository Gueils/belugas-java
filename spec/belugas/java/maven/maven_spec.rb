require 'spec_helper'

describe Belugas::Java::Maven::Maven do
  subject(:subject_ee) { Belugas::Java::Maven::Maven.new('spec/support/java_ee/pom.xml') }
  subject(:subject_se) { Belugas::Java::Maven::Maven.new('spec/support/java_se/pom.xml') }

  context 'For Java SE' do
    it 'should return a platform' do
      expect(subject_se.java_platform).to eq('Java SE')
    end
  end

  context 'For Java EE' do
    it 'should return a platform' do
      expect(subject_ee.java_platform).to eq('Java EE')
    end
  end
end
