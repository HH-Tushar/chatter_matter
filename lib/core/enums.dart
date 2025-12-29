enum JobStatus {
  open,
  assigned,
  engaged,
  offered, // Job is created but not yet started
   // Job is currently being worked on
  completed, // Job has been successfully completed
  failed, // Job encountered an error or failure
  cancelled, // Job was cancelled before completion
  onHold, // Job is paused or waiting for input
}

enum UserRole { customer, contractor }
enum ToastType { warning,success,failed}

enum OfferActionType { accept, reject, cancel }

