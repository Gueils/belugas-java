require 'spec_helper'
require 'nokogiri'

describe Belugas::Java::Maven::Parser::Properties do

 before {
   @document =  Nokogiri::XML(File.open('spec/support/pom_console.xml'))
   @document_web =  Nokogiri::XML(File.open('spec/support/pom.xml'))
 }

 subject(:subject_console) { Belugas::Java::Maven::Parser::Properties.new(@document) }
 subject(:subject_web) { Belugas::Java::Maven::Parser::Properties.new(@document_web) }

 context 'Maven Propieties Console' do
   it 'Packaging Jar' do
     expect(subject_console.packaging).to eq('jar')
   end
   it 'Java Version' do
      expect(subject_console.java_version).to eq('1.8')
   end
 end

 context 'Maven Propieties Web' do
   it 'Packaging Jar' do
     expect(subject_web.packaging).to eq('war')
   end
   it 'Java Version' do
      expect(subject_web.java_version).to eq('1.7')
   end
 end
end
