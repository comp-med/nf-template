process PROCESS_TEMPLATE {
  
  // cache 'lenient'
  // tag "$input_value"
  // label 'process_label'
  // publishDir

  input:
    tuple val(some_value), path(some_path)
    path(some_other_path)
    each meta

  output:
    path "./optional_dir/*file.ext", optional: false, emit: output_name

  script:
  """
  ./script.R \
    $some_value \
    $some_path \
    $some_other_path \
    ${task.some_parameter} \
    ${params.some_parameter}

  """

  stub:
  """
  mkdir optional_dir/
  touch optional_dir/output.txt
  """

}
