module Reality
  describe EntityClass do
    subject(:klass){
      Module.new{
        extend EntityClass
      }
    }
    subject(:object){double}

    describe 'properties definition' do
      before{
        klass.property :continent, type: :entity, wikidata: 'P30'
      }
      it 'should store properties list' do
        expect(klass.properties).to include(:continent)
      end

      it 'should define property accessor methods on owner object' do
        e = Entity.new('Foo')
        e.extend(klass)
        expect(e).to respond_to(:continent)
        expect(e.properties).to include(:continent)
      end
    end

    describe 'guessing' do
      subject(:klass2){
        Module.new{
          extend EntityClass
        }
      }
      before{
        klass.by_infobox 'Infobox settlement', 'Infobox city'
        klass2.by_infobox 'Infobox country'
      }
      let(:obj1){
        double(wikipage: double(infobox: double(name: 'Infobox settlement')))
      }
      let(:obj2){
        double(wikipage: double(infobox: double(name: 'Infobox country')))
      }
      it 'should guess correctly' do
        expect(EntityClass.for(obj1)).to eq klass
        expect(EntityClass.for(obj2)).to eq klass2
      end
    end

    describe 'composition' do
    end
    
  end
end
