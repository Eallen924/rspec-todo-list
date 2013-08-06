require "rspec"

require_relative "list"

describe List do

  let(:title)   { "Priya's Party" }
  let(:incomplete_task) do
    task = double("task")
    task.stub(:description => "orange", :complete? => false)
    task
  end
  
  let(:complete_task) do
    task = double("task")
    task.stub(:description => "orange", :complete? => true)
    task
  end

  let(:list) { List.new(title, [complete_task, complete_task, incomplete_task]) }

  
  describe "#initialize" do
    it "requires one argument (title)" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  describe "#add_task" do 
    it "adds a task to the list array" do
      expect { list.add_task(incomplete_task) }.to change{list.tasks.count}.by(1)
    end
  end

  describe "#complete_task" do 
    it "completes a task" do
      incomplete_task.should_receive(:complete!)
      list.complete_task(2)
    end
  end

  describe "#delete_task" do 
    it "deletes a task" do
      expect { list.delete_task(0) }.to change{list.tasks.count}.by(-1)
    end
  end

  describe "#completed_tasks" do 
    it "returns an array" do
      complete_task.should_receive(:complete?)
      incomplete_task.should_receive(:complete?)
      expect(list.completed_tasks.class).to eq(Array)
    end

    it "returns the correct number of completed tasks" do
      complete_task.should_receive(:complete?)
      incomplete_task.should_receive(:complete?)
      expect(list.completed_tasks.length).to eq(2)
    end
  end

  describe "#incomplete_tasks" do 
    it "returns an array" do
      complete_task.should_receive(:complete?)
      incomplete_task.should_receive(:complete?)
      expect(list.incomplete_tasks.class).to eq(Array)
    end

    it "returns the correct number of incomplete tasks" do
      complete_task.should_receive(:complete?)
      incomplete_task.should_receive(:complete?)
      expect(list.incomplete_tasks.length).to eq(1)
    end
  end
end
