include { PROCESS_TEMPLATE } from '../modules/module.nf'

workflow WORKFLOW {

  def dummy_input = ["input1", "input2"]
  def some_parameter = params.input
  def meta = "some meta parameter"

  // input_ch = channel.fromPath(some_parameter, checkIfExists: true)
  
  // ...
  PROCESS_TEMPLATE(
    dummy_input,
    some_parameter,
    meta
  )

}
