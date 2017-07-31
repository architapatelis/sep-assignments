include RSpec

require_relative 'min_binary_heap'

RSpec.describe Heap, type: Class do

  let (:heap) { Heap.new }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and rearranges accroding to rating" do
      heap.insert(matrix)
      expect(heap.heap_list[1].title).to eq "The Matrix"
      heap.insert(pacific_rim)
      expect(heap.heap_list[1].title).to eq "Pacific Rim"
      expect(heap.heap_list[2].title).to eq "The Matrix"
      heap.insert(district)
      expect(heap.heap_list[3].title).to eq "District 9"
    end
  end
  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(district)
      heap.insert(shawshank)
      heap.insert(hope)
      heap.insert(empire)
      expect(heap.find(nil)).to eq nil
    end

    it "find the correct node" do
      heap.insert(district)
      heap.insert(shawshank)
      heap.insert(hope)
      heap.insert(empire)
      expect(heap.find("Star Wars: A New Hope").title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(nil)).to eq nil
    end

    it "properly deletes node " do
      expected_output = "Star Wars: Return of the Jedi: 80\nThe Matrix: 87\n"
      heap.insert(matrix)
      heap.insert(jedi)
      heap.insert(pacific_rim)
      heap.delete("Pacific Rim")
      expect { heap.print }.to output(expected_output).to_stdout
      expect(heap.heap_list[1].title).to eq "Star Wars: Return of the Jedi"
      expect(heap.heap_list[2].title).to eq "The Matrix"
    end

  end

  describe "#print" do
    specify {
      expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nDonnie Darko: 85\nInception: 86\nDistrict 9: 90\nThe Matrix: 87\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      heap.insert(jedi)
      heap.insert(donnie)
      heap.insert(inception)
      heap.insert(district)
      heap.insert(matrix)
      heap.insert(shawshank)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(empire)
      heap.insert(mad_max_2)
      expect { heap.print }.to output(expected_output).to_stdout
    }
    print()
  end
end
