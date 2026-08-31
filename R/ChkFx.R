ChkFx = function(func, x)
{
  if (is.matrix(x)) { Given = "matrix"
  } else if (length(x) == 1) { Given = "scalar"
  } else { Given = "vector" }

  DefOpt = options(show.error.message = FALSE)

  if (Given == "matrix") {
    Repeat = "Yes"
    R1 = try(func(x[1,]), silent=TRUE)
    if (is.numeric(R1)) {
      minInput = "vector"
      if (length(R1) == 1) {
        CaseNo = 6
        minOutput = "scalar"
        Gradient = "vector"
      } else {
        CaseNo = 8
        minOutput = "vector"
        Gradient = "matrix"
      }
    } else {
      CaseNo = NA
      minInput = "No numeric function"
      minOutput = "NA"
      Repeat = "NA"
      Gradient = "NA"
    }

  } else {

    R1 = try(func(x[1]), silent=TRUE)
    R2 = try(func(c(x[1], x[1])), silent=TRUE)
    if (is.numeric(R1)) {
      minInput = "scalar"
      if (length(R1) == 1) {
        minOutput = "scalar"
        if (length(R2) == 1) {
          CaseNo = 5
          Repeat = "No"
          Gradient = "scalar"
        } else {
          if (Given == "scalar") {
            CaseNo = 1
            Repeat = "No"
            Gradient = "scalar"
          } else {
            CaseNo = 2
            Repeat = "Yes"
            Gradient = "vector"
          }
        }

      } else {
        minOutput = "vector"
        if (Given == "scalar") {
          CaseNo = 3
          Repeat = "No"
          Gradient = "vector"
        } else {
          CaseNo = 4
          Repeat = "Yes"
          Gradient = "matrix"
        }
      }

    } else {
      R1 = try(func(x), silent=TRUE)
      if (is.numeric(R1)) {
        minInput = "vector"
        if (length(R1) == 1) {
          CaseNo = 5
          minOutput = "scalar"
          Repeat = "No"
          Gradient = "scalar"
        } else {
          CaseNo = 7
          minOutput = "vector"
          Repeat = "No"
          Gradient = "vector"
        }
      } else {
        CaseNo = NA
        minInput = "No numeric function"
        minOutput = "NA"
        Repeat = "NA"
        Gradient = "NA"
      }
    }
  }

  options(show.error.message = DefOpt)
  Result = c(CaseNo, minInput, minOutput, Given, Repeat, Gradient)
  names(Result) = c("CaseNo", "minInput", "minOutput", "Given", "Repeat", "Gradient")
  return(Result)
}

