# As A Quality Representative
# I Want coding metrics
# And automations
# So That I can ensure code quality

# Given the source code
# When I run linting
# Then I get no lints
test_that("QSOL-3546", {
  skip_on_covr()
  lints <- lintr::lint_package("../../",
    exclusions = list(
      "vignettes"
    )
  )
  if (length(lints) != 0) {
    print("")
    print(lints)
    fail("Linting failed")
  } else {
    succeed()
  }

})
