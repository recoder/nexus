describe Tiny::Url do
  describe '#compute_slug' do
    it 'computes slugs' do
      expect(Tiny::Url.compute_slug('foo', 3).length).to eq 3
    end
  end
end
