require 'gosu_albacore'

describe 'Solution' do
  before(:each) do
    @solution = Solution.new('solution_name', '/solution/directory/')
  end
  
  it 'has solution file /solution/directory/solution_name.sln' do
    @solution.solution_file.should == '/solution/directory/solution_name.sln'
  end

  it 'adding an executable project marks the project as executable' do
    @solution.add_executable_project 'project_name'
    @solution.projects[0].is_executable.should be_true
  end
end
