# To run these specs:
# > gem install rspec
# > rspec filename.rb

require 'gosu_albacore'

describe Project do
  before(:each) do
    @project = Project.new('project_name', '/solution/directory/')
  end

  it 'has bin folder /solution/directory/project_name/bin' do
    @project.bin_folder.should == '/solution/directory/project_name/bin/'
  end

  it 'has bin release folder /solution/directory/project_name/bin/Release/' do
    @project.release_folder.should == '/solution/directory/project_name/bin/Release/'
  end

  it 'has bin debug folder /solution/directory/project_name/bin/Debug/' do
    @project.debug_folder.should == '/solution/directory/project_name/bin/Debug/'
  end

  it 'has obj folder /solution/directory/project_name/obj/' do
    @project.obj_folder.should == '/solution/directory/project_name/obj/'
  end

  it 'has assembly name project_name.dll' do
    @project.assembly_name.should == 'project_name.dll'
  end

  it 'has release assembly /solution/directory/project_name/bin/Release/project_name.dll' do
    @project.release_assembly.should == '/solution/directory/project_name/bin/Release/project_name.dll'
  end

  it 'has debug assembly /solution/directory/project_name/bin/Debug/project_name.dll' do
    @project.debug_assembly.should == '/solution/directory/project_name/bin/Debug/project_name.dll'
  end

  it 'has bin assembly /solution/directory/project_name/bin/project_name.dll' do
    @project.bin_assembly.should == '/solution/directory/project_name/bin/project_name.dll'
  end
end

describe "Executable project" do
  before(:each) do
    @project = Project.new('project_name', '/solution/directory/')
    @project.is_executable = true;
  end
  
  it "has assembly name project_name.exe" do
    @project.assembly_name.should == 'project_name.exe'
  end
end
