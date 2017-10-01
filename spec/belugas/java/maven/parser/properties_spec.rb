require 'spec_helper'
require 'nokogiri'

describe Belugas::Java::Maven::Parser::Properties do

 before {
   @document =  Nokogiri::XML(File.open('spec/support/java_se/pom.xml'))
   @document_web =  Nokogiri::XML(File.open('spec/support/java_ee/pom.xml'))
 }

 subject(:subject_se) { Belugas::Java::Maven::Parser::Properties.new(@document) }
 subject(:subject_ee) { Belugas::Java::Maven::Parser::Properties.new(@document_web) }

 context 'For a Jave SE' do
   it 'should return a jar packaging' do
     expect(subject_se.packaging).to eq('jar')
   end
   it 'should return java version' do
      expect(subject_se.java_version).to eq('1.8')
   end
 end

 context 'For a Jave EE' do
   it 'should return a war packaging' do
     expect(subject_ee.packaging).to eq('war')
   end
   it 'should return java version' do
      expect(subject_ee.java_version).to eq('1.7')
   end
 end
end
