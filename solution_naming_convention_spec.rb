# To run these specs:
# > gem install rspec
# > rspec filename.rb

require 'solution_naming_convention'

describe SolutionNamingConvention do
  before(:each) do
    @convention = SolutionNamingConvention.new
    @convention.solution_name = "SolutionName"
    @convention.solution_folder = "SolutionFolder"
  end

  it "solution file path is SolutionFolder/SolutionName.sln" do
    solution_file_path = @convention.solution_file_path
    solution_file_path.should == "SolutionFolder/SolutionName.sln"
  end

  it "project folder name is SolutionName.ProjectName" do
    project_folder_name = @convention.project_folder_name("ProjectName")
    project_folder_name.should == "SolutionName.ProjectName"
  end

  it "assembly name is SolutionName.ProjectName.dll" do
    assembly_name = @convention.assembly_name("ProjectName")
    assembly_name.should == "SolutionName.ProjectName.dll"
  end

  it "assembly name with extension is SolutionName.ProjectName.Extension" do
    assembly_name = @convention.assembly_name("ProjectName", "exe")
    assembly_name.should == "SolutionName.ProjectName.exe"
  end

  it "project folder is SolutionFolder/SolutionName.ProjectName/" do
    project_folder = @convention.project_folder("ProjectName")
    project_folder.should == "SolutionFolder/SolutionName.ProjectName/"
  end

  it "bin folder is SolutionFolder/SolutionName.ProjectName/bin/ when no configuration is specified" do
    bin_folder = @convention.bin_folder("ProjectName")
    bin_folder.should == "SolutionFolder/SolutionName.ProjectName/bin/"
  end

  it "bin folder is SolutionFolder/SolutionName.ProjectName/bin/configuration when configuration is specified" do
    bin_folder = @convention.bin_folder("ProjectName", "debug")
    bin_folder.should == "SolutionFolder/SolutionName.ProjectName/bin/debug/"
  end

  it "obj folder is SolutionFolder/SolutionName.ProjectName/obj/ when no configuration is specified" do
    obj_folder = @convention.obj_folder("ProjectName")
    obj_folder.should == "SolutionFolder/SolutionName.ProjectName/obj/"
  end

  it "obj folder is SolutionFolder/SolutionName.ProjectName/obj/configuration when configuration is specified" do
    obj_folder = @convention.obj_folder("ProjectName", "debug")
    obj_folder.should == "SolutionFolder/SolutionName.ProjectName/obj/debug/"
  end


  it "assembly path with no build configuration is SolutionFolder/SolutionName.ProjectName/bin/SolutionName.ProjectName.dll" do
    assembly_path = @convention.assembly_path("ProjectName")
    assembly_path.should == "SolutionFolder/SolutionName.ProjectName/bin/SolutionName.ProjectName.dll"
  end

  it "assembly path with build configuration is SolutionFolder/SolutionName.ProjectName/bin/BuildConfiguration/SolutionName.ProjectName.dll" do
    assembly_path = @convention.assembly_path("ProjectName", "Release")
    assembly_path.should == "SolutionFolder/SolutionName.ProjectName/bin/Release/SolutionName.ProjectName.dll"
  end

  it "assembly path with extension is SolutionFolder/SolutionName.ProjectName/bin/BuildConfiguration/SolutionName.ProjectName.Extension" do
    assembly_path = @convention.assembly_path("ProjectName", "Release", "exe")
    assembly_path.should == "SolutionFolder/SolutionName.ProjectName/bin/Release/SolutionName.ProjectName.exe"
  end
end
