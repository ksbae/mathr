# Guard for the functions here that work a value at a time.
#
# Their branches are ordinary if statements rather than vectorised
# arithmetic, so a vector reaches the first one and R stops with "the
# condition has length > 1", which names neither the function nor the
# reason. This says both. It is internal: the leading dot keeps it out
# of exportPattern("^[[:alpha:]]+").
#
# Only the arguments that actually drive an if are passed in. Several of
# these functions take a vector elsewhere and give the right answer for
# it, and those arguments are deliberately left unguarded.

.Scalar1 = function(Fn, ...)
{
  Len = vapply(list(...), length, 0L)
  if (all(Len == 1L)) return (invisible(NULL))
  Nms = as.character(substitute(list(...)))[-1]
  stop (Fn, " takes one value at a time; ",
        paste(Nms[Len != 1L], collapse = ", "),
        " must be a single number. Use sapply() for a vector.",
        call. = FALSE)
}
