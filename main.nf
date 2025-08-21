#!/usr/bin/env nextflow

// https://sydney-informatics-hub.github.io/template-nf-guide/
nextflow.enable.dsl=2

// HEADER ---------------------------------------------------------------------

def startupMsg() {
    log.info """\
    ===============================================================================
    Pipeline Name
    ===============================================================================

    Created by the Computational Medicine Group | BIH @ Charité

    ===============================================================================
    Workflow run parameters 
    ===============================================================================
    input       : ${params.input}
    outDir      : ${params.outDir}
    workDir     : ${workflow.workDir}
    ===============================================================================

    """.stripIndent()
}

// SUMMARY --------------------------------------------------------------------

def completionMsg() {
  log.info """
  ===============================================================================
  Workflow execution summary
  ===============================================================================

  Duration    : ${workflow.duration}
  Success     : ${workflow.success}
  workDir     : ${workflow.workDir}
  Exit status : ${workflow.exitStatus}
  outDir      : ${params.outDir}

  ===============================================================================
  """.stripIndent()
}

// Help function
def helpMessage() {
  log.info"""
  Usage:  nextflow run main.nf 

  Required Arguments:

  <TODO>

  Optional Arguments:

  --outDir	Specify path to output directory. Default is `output/`
	
""".stripIndent()
}

// MODULES --------------------------------------------------------------------

include { WORKFLOW } from './workflows/workflow.nf'

// WORKFLOW -------------------------------------------------------------------

workflow {

  startupMsg()
  if ( false ) { // Enter some condition!
    helpMessage()
    exit 1
  }
  
  WORKFLOW ()

}

// TODO: Move this inside the workflow as suggested here:
// https://www.nextflow.io/docs/latest/notifications.html#completion-handler
// As of 2025-08-21, this does not work and the LSP shows an error for this 
// solution, but it works
workflow.onComplete {
  completionMsg()
}
