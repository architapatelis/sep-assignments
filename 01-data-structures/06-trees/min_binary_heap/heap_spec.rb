include RSpec

require_relative 'min_binary_heap'

RSpec.describe Heap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { Heap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
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

  describe "#insert(root, data)" do
    it "properly inserts a new lower value node as left child" do
      heap.insert(heap.root, hope)
      expect(heap.root.title).to eq "The Matrix"
      expect(heap.root.left.title).to eq "Star Wars: A New Hope"
    end

    it "properly inserts a new higher value node as right child" do
      heap.insert(heap.root, district)
      heap.insert(heap.root, empire)
      expect(heap.root.right.title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly inserts a new lower value node as root" do
      expected_output = "Pacific Rim: 72\nThe Matrix: 87\nStar Wars: Return of the Jedi: 80\n"
      heap.insert(heap.root, jedi)
      heap.insert(jedi, pacific_rim)
      expect { heap.print }.to output(expected_output).to_stdout
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a left-left node" do
      heap.insert(root, braveheart)
      heap.insert(braveheart, pacific_rim)
      heap.insert(pacific_rim, martian)
      expect(heap.find(pacific_rim, martian.title).title).to eq "The Martian"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(root, empire)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes root node" do
      expected_output = "Star Wars: Return of the Jedi: 80\nThe Matrix: 87\n"
      heap.insert(root, jedi)
      heap.insert(heap.root, pacific_rim)
      heap.delete(pacific_rim, pacific_rim.title)
      expect { heap.print }.to output(expected_output).to_stdout
    end

    it "properly inserts the swaped node to correct location after deletion" do
      expected_output = "Braveheart: 78\nStar Wars: Return of the Jedi: 80\nDistrict 9: 90\nThe Matrix: 87\nDonnie Darko: 85\nStar Wars: The Empire Strikes Back: 94\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\nThe Shawshank Redemption: 91\nStar Wars: A New Hope: 93\nInception: 86\n"
      heap.insert(root, hope)
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      heap.insert(root, district)
      heap.insert(root, jedi)
      heap.insert(jedi, donnie)
      heap.insert(jedi, inception)
      heap.insert(jedi, braveheart)
      heap.insert(braveheart, pacific_rim)
      heap.delete(pacific_rim, pacific_rim.title)
      expect(heap.find(braveheart, pacific_rim.title)).to be_nil
      expect { heap.print }.to output(expected_output).to_stdout
    end
  end

  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(root, hope)
       heap.insert(root, empire)
       heap.insert(root, jedi)
       heap.insert(jedi, martian)
       heap.insert(jedi, pacific_rim)
       heap.insert(pacific_rim, inception)
       heap.insert(pacific_rim, braveheart)
       heap.insert(pacific_rim, shawshank)
       heap.insert(pacific_rim, district)
       heap.insert(pacific_rim, mad_max_2)
       expect { heap.print }.to output(expected_output).to_stdout
     }
     print()
  end
end
