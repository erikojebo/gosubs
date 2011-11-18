class SolutionNamingConvention
  attr_accessor :solution_name, :solution_folder

  def solution_file_path()
    File.join(solution_folder, solution_name) + ".sln"
  end

  def project_folder_name(project_name)
    solution_name + "." + project_name
  end

  def assembly_name(project_name, extension = "dll")
    project_folder_name(project_name) + "." + extension
  end

  def project_folder(project_name)
    File.join(solution_folder, solution_name + "." + project_name) + "/"
  end

  def bin_folder(project_name, build_configuration = "")
    bin_folder = File.join(project_folder(project_name), "bin", build_configuration)
    add_final_slash bin_folder
  end

  def obj_folder(project_name, build_configuration = "")
    obj_folder = File.join(project_folder(project_name), "obj", build_configuration)
    add_final_slash obj_folder
  end

  def assembly_path(project_name, build_configuration = "", extension = "dll")
    bin_folder = bin_folder(project_name, build_configuration)
    assembly_name = assembly_name(project_name, extension)

    File.join(bin_folder, assembly_name)
  end

  def add_final_slash(path)
    ends_with_slash = path =~ /\/$/
    ends_with_slash ? path : path + "/"
  end
end
